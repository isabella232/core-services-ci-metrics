module Api
  module V1
    class FailuresController < BaseController
      def index
        respond_with Failure.all
      end

      def create
        permitted = params.require(:failure).permit(:pipeline, :job, :build_id, :build)
        failure = Failure.new(permitted)
        failure.save

        respond_with :api, :v1, failure
      end

      def update
        failure = Failure.find(params[:id])
        failure.update(params.require(:failure).permit(:pipeline, :job, :build_id, :build, :task, :description, :category))

        respond_with :api, :v1, failure
      end
    end
  end
end
