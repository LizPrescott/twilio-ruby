##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Taskrouter < Domain
      class V1 < Version
        class WorkspaceList < ListResource
          ##
          # Initialize the WorkspaceList
          # @param [Version] version Version that contains the resource
          # @return [WorkspaceList] WorkspaceList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
            @uri = "/Workspaces"
          end

          ##
          # Lists WorkspaceInstance records from the API as a list.
          # Unlike stream(), this operation is eager and will load `limit` records into
          # memory before returning.
          # @param [String] friendly_name The friendly_name
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #    guarantees to never return more than limit.  Default is no limit
          # @param [Integer] page_size Number of records to fetch per request, when
          #    not set will use the default value of 50 records.  If no page_size is defined
          #    but a limit is defined, stream() will attempt to read the limit with the most
          #    efficient page size, i.e. min(limit, 1000)
          # @return [Array] Array of up to limit results
          def list(friendly_name: :unset, limit: nil, page_size: nil)
            self.stream(
                friendly_name: friendly_name,
                limit: limit,
                page_size: page_size
            ).entries
          end

          ##
          # Streams WorkspaceInstance records from the API as an Enumerable.
          # This operation lazily loads records as efficiently as possible until the limit
          # is reached.
          # @param [String] friendly_name The friendly_name
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #    guarantees to never return more than limit. Default is no limit.
          # @param [Integer] page_size Number of records to fetch per request, when
          #    not set will use the default value of 50 records. If no page_size is defined
          #    but a limit is defined, stream() will attempt to read the limit with the most
          #    efficient page size, i.e. min(limit, 1000)
          # @return [Enumerable] Enumerable that will yield up to limit results
          def stream(friendly_name: :unset, limit: nil, page_size: nil)
            limits = @version.read_limits(limit, page_size)

            page = self.page(
                friendly_name: friendly_name,
                page_size: limits[:page_size],
            )

            @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
          end

          ##
          # When passed a block, yields WorkspaceInstance records from the API.
          # This operation lazily loads records as efficiently as possible until the limit
          # is reached.
          def each
            limits = @version.read_limits

            page = self.page(
                page_size: limits[:page_size],
            )

            @version.stream(page,
                            limit: limits[:limit],
                            page_limit: limits[:page_limit]).each {|x| yield x}
          end

          ##
          # Retrieve a single page of WorkspaceInstance records from the API.
          # Request is executed immediately.
          # @param [String] friendly_name The friendly_name
          # @param [String] page_token PageToken provided by the API
          # @param [Integer] page_number Page Number, this value is simply for client state
          # @param [Integer] page_size Number of records to return, defaults to 50
          # @return [Page] Page of WorkspaceInstance
          def page(friendly_name: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
            params = Twilio::Values.of({
                'FriendlyName' => friendly_name,
                'PageToken' => page_token,
                'Page' => page_number,
                'PageSize' => page_size,
            })
            response = @version.page(
                'GET',
                @uri,
                params
            )
            WorkspacePage.new(@version, response, @solution)
          end

          ##
          # Retrieve a single page of WorkspaceInstance records from the API.
          # Request is executed immediately.
          # @param [String] target_url API-generated URL for the requested results page
          # @return [Page] Page of WorkspaceInstance
          def get_page(target_url)
            response = @version.domain.request(
                'GET',
                target_url
            )
            WorkspacePage.new(@version, response, @solution)
          end

          ##
          # Retrieve a single page of WorkspaceInstance records from the API.
          # Request is executed immediately.
          # @param [String] friendly_name The friendly_name
          # @param [String] event_callback_url The event_callback_url
          # @param [String] events_filter The events_filter
          # @param [Boolean] multi_task_enabled The multi_task_enabled
          # @param [String] template The template
          # @param [workspace.QueueOrder] prioritize_queue_order The prioritize_queue_order
          # @return [WorkspaceInstance] Newly created WorkspaceInstance
          def create(friendly_name: nil, event_callback_url: :unset, events_filter: :unset, multi_task_enabled: :unset, template: :unset, prioritize_queue_order: :unset)
            data = Twilio::Values.of({
                'FriendlyName' => friendly_name,
                'EventCallbackUrl' => event_callback_url,
                'EventsFilter' => events_filter,
                'MultiTaskEnabled' => multi_task_enabled,
                'Template' => template,
                'PrioritizeQueueOrder' => prioritize_queue_order,
            })

            payload = @version.create(
                'POST',
                @uri,
                data: data
            )

            WorkspaceInstance.new(
                @version,
                payload,
            )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Taskrouter.V1.WorkspaceList>'
          end
        end

        class WorkspacePage < Page
          ##
          # Initialize the WorkspacePage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [WorkspacePage] WorkspacePage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of WorkspaceInstance
          # @param [Hash] payload Payload response from the API
          # @return [WorkspaceInstance] WorkspaceInstance
          def get_instance(payload)
            WorkspaceInstance.new(
                @version,
                payload,
            )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Taskrouter.V1.WorkspacePage>'
          end
        end

        class WorkspaceContext < InstanceContext
          ##
          # Initialize the WorkspaceContext
          # @param [Version] version Version that contains the resource
          # @param [String] sid The sid
          # @return [WorkspaceContext] WorkspaceContext
          def initialize(version, sid)
            super(version)

            # Path Solution
            @solution = {
                sid: sid,
            }
            @uri = "/Workspaces/#{@solution[:sid]}"

            # Dependents
            @activities = nil
            @events = nil
            @tasks = nil
            @task_queues = nil
            @workers = nil
            @workflows = nil
            @statistics = nil
            @task_channels = nil
          end

          ##
          # Fetch a WorkspaceInstance
          # @return [WorkspaceInstance] Fetched WorkspaceInstance
          def fetch
            params = Twilio::Values.of({})

            payload = @version.fetch(
                'GET',
                @uri,
                params,
            )

            WorkspaceInstance.new(
                @version,
                payload,
                sid: @solution[:sid],
            )
          end

          ##
          # Update the WorkspaceInstance
          # @param [String] default_activity_sid The default_activity_sid
          # @param [String] event_callback_url The event_callback_url
          # @param [String] events_filter The events_filter
          # @param [String] friendly_name The friendly_name
          # @param [Boolean] multi_task_enabled The multi_task_enabled
          # @param [String] timeout_activity_sid The timeout_activity_sid
          # @param [workspace.QueueOrder] prioritize_queue_order The prioritize_queue_order
          # @return [WorkspaceInstance] Updated WorkspaceInstance
          def update(default_activity_sid: :unset, event_callback_url: :unset, events_filter: :unset, friendly_name: :unset, multi_task_enabled: :unset, timeout_activity_sid: :unset, prioritize_queue_order: :unset)
            data = Twilio::Values.of({
                'DefaultActivitySid' => default_activity_sid,
                'EventCallbackUrl' => event_callback_url,
                'EventsFilter' => events_filter,
                'FriendlyName' => friendly_name,
                'MultiTaskEnabled' => multi_task_enabled,
                'TimeoutActivitySid' => timeout_activity_sid,
                'PrioritizeQueueOrder' => prioritize_queue_order,
            })

            payload = @version.update(
                'POST',
                @uri,
                data: data,
            )

            WorkspaceInstance.new(
                @version,
                payload,
                sid: @solution[:sid],
            )
          end

          ##
          # Deletes the WorkspaceInstance
          # @return [Boolean] true if delete succeeds, true otherwise
          def delete
            @version.delete('delete', @uri)
          end

          ##
          # Access the activities
          # @return [ActivityList]
          # @return [ActivityContext] if sid was passed.
          def activities(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return ActivityContext.new(
                  @version,
                  @solution[:sid],
                  sid,
              )
            end

            unless @activities
              @activities = ActivityList.new(
                  @version,
                  workspace_sid: @solution[:sid],
              )
            end

            @activities
          end

          ##
          # Access the events
          # @return [EventList]
          # @return [EventContext] if sid was passed.
          def events(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return EventContext.new(
                  @version,
                  @solution[:sid],
                  sid,
              )
            end

            unless @events
              @events = EventList.new(
                  @version,
                  workspace_sid: @solution[:sid],
              )
            end

            @events
          end

          ##
          # Access the tasks
          # @return [TaskList]
          # @return [TaskContext] if sid was passed.
          def tasks(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return TaskContext.new(
                  @version,
                  @solution[:sid],
                  sid,
              )
            end

            unless @tasks
              @tasks = TaskList.new(
                  @version,
                  workspace_sid: @solution[:sid],
              )
            end

            @tasks
          end

          ##
          # Access the task_queues
          # @return [TaskQueueList]
          # @return [TaskQueueContext] if sid was passed.
          def task_queues(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return TaskQueueContext.new(
                  @version,
                  @solution[:sid],
                  sid,
              )
            end

            unless @task_queues
              @task_queues = TaskQueueList.new(
                  @version,
                  workspace_sid: @solution[:sid],
              )
            end

            @task_queues
          end

          ##
          # Access the workers
          # @return [WorkerList]
          # @return [WorkerContext] if sid was passed.
          def workers(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return WorkerContext.new(
                  @version,
                  @solution[:sid],
                  sid,
              )
            end

            unless @workers
              @workers = WorkerList.new(
                  @version,
                  workspace_sid: @solution[:sid],
              )
            end

            @workers
          end

          ##
          # Access the workflows
          # @return [WorkflowList]
          # @return [WorkflowContext] if sid was passed.
          def workflows(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return WorkflowContext.new(
                  @version,
                  @solution[:sid],
                  sid,
              )
            end

            unless @workflows
              @workflows = WorkflowList.new(
                  @version,
                  workspace_sid: @solution[:sid],
              )
            end

            @workflows
          end

          ##
          # Access the statistics
          # @return [WorkspaceStatisticsList]
          # @return [WorkspaceStatisticsContext]
          def statistics
            WorkspaceStatisticsContext.new(
                @version,
                @solution[:sid],
            )
          end

          ##
          # Access the task_channels
          # @return [TaskChannelList]
          # @return [TaskChannelContext] if sid was passed.
          def task_channels(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return TaskChannelContext.new(
                  @version,
                  @solution[:sid],
                  sid,
              )
            end

            unless @task_channels
              @task_channels = TaskChannelList.new(
                  @version,
                  workspace_sid: @solution[:sid],
              )
            end

            @task_channels
          end

          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Taskrouter.V1.WorkspaceContext #{context}>"
          end
        end

        class WorkspaceInstance < InstanceResource
          ##
          # Initialize the WorkspaceInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @param [String] sid The sid
          # @return [WorkspaceInstance] WorkspaceInstance
          def initialize(version, payload, sid: nil)
            super(version)

            # Marshaled Properties
            @properties = {
                'account_sid' => payload['account_sid'],
                'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                'default_activity_name' => payload['default_activity_name'],
                'default_activity_sid' => payload['default_activity_sid'],
                'event_callback_url' => payload['event_callback_url'],
                'events_filter' => payload['events_filter'],
                'friendly_name' => payload['friendly_name'],
                'multi_task_enabled' => payload['multi_task_enabled'],
                'sid' => payload['sid'],
                'timeout_activity_name' => payload['timeout_activity_name'],
                'timeout_activity_sid' => payload['timeout_activity_sid'],
                'prioritize_queue_order' => payload['prioritize_queue_order'],
                'url' => payload['url'],
                'links' => payload['links'],
            }

            # Context
            @instance_context = nil
            @params = {
                'sid' => sid || @properties['sid'],
            }
          end

          ##
          # Generate an instance context for the instance, the context is capable of
          # performing various actions.  All instance actions are proxied to the context
          # @return [WorkspaceContext] WorkspaceContext for this WorkspaceInstance
          def context
            unless @instance_context
              @instance_context = WorkspaceContext.new(
                  @version,
                  @params['sid'],
              )
            end
            @instance_context
          end

          ##
          # @return [String] The account_sid
          def account_sid
            @properties['account_sid']
          end

          ##
          # @return [Time] The date_created
          def date_created
            @properties['date_created']
          end

          ##
          # @return [Time] The date_updated
          def date_updated
            @properties['date_updated']
          end

          ##
          # @return [String] The default_activity_name
          def default_activity_name
            @properties['default_activity_name']
          end

          ##
          # @return [String] The default_activity_sid
          def default_activity_sid
            @properties['default_activity_sid']
          end

          ##
          # @return [String] The event_callback_url
          def event_callback_url
            @properties['event_callback_url']
          end

          ##
          # @return [String] The events_filter
          def events_filter
            @properties['events_filter']
          end

          ##
          # @return [String] The friendly_name
          def friendly_name
            @properties['friendly_name']
          end

          ##
          # @return [Boolean] The multi_task_enabled
          def multi_task_enabled
            @properties['multi_task_enabled']
          end

          ##
          # @return [String] The sid
          def sid
            @properties['sid']
          end

          ##
          # @return [String] The timeout_activity_name
          def timeout_activity_name
            @properties['timeout_activity_name']
          end

          ##
          # @return [String] The timeout_activity_sid
          def timeout_activity_sid
            @properties['timeout_activity_sid']
          end

          ##
          # @return [workspace.QueueOrder] The prioritize_queue_order
          def prioritize_queue_order
            @properties['prioritize_queue_order']
          end

          ##
          # @return [String] The url
          def url
            @properties['url']
          end

          ##
          # @return [String] The links
          def links
            @properties['links']
          end

          ##
          # Fetch a WorkspaceInstance
          # @return [WorkspaceInstance] Fetched WorkspaceInstance
          def fetch
            context.fetch
          end

          ##
          # Update the WorkspaceInstance
          # @param [String] default_activity_sid The default_activity_sid
          # @param [String] event_callback_url The event_callback_url
          # @param [String] events_filter The events_filter
          # @param [String] friendly_name The friendly_name
          # @param [Boolean] multi_task_enabled The multi_task_enabled
          # @param [String] timeout_activity_sid The timeout_activity_sid
          # @param [workspace.QueueOrder] prioritize_queue_order The prioritize_queue_order
          # @return [WorkspaceInstance] Updated WorkspaceInstance
          def update(default_activity_sid: :unset, event_callback_url: :unset, events_filter: :unset, friendly_name: :unset, multi_task_enabled: :unset, timeout_activity_sid: :unset, prioritize_queue_order: :unset)
            context.update(
                default_activity_sid: default_activity_sid,
                event_callback_url: event_callback_url,
                events_filter: events_filter,
                friendly_name: friendly_name,
                multi_task_enabled: multi_task_enabled,
                timeout_activity_sid: timeout_activity_sid,
                prioritize_queue_order: prioritize_queue_order,
            )
          end

          ##
          # Deletes the WorkspaceInstance
          # @return [Boolean] true if delete succeeds, true otherwise
          def delete
            context.delete
          end

          ##
          # Access the activities
          # @return [activities] activities
          def activities
            context.activities
          end

          ##
          # Access the events
          # @return [events] events
          def events
            context.events
          end

          ##
          # Access the tasks
          # @return [tasks] tasks
          def tasks
            context.tasks
          end

          ##
          # Access the task_queues
          # @return [task_queues] task_queues
          def task_queues
            context.task_queues
          end

          ##
          # Access the workers
          # @return [workers] workers
          def workers
            context.workers
          end

          ##
          # Access the workflows
          # @return [workflows] workflows
          def workflows
            context.workflows
          end

          ##
          # Access the statistics
          # @return [statistics] statistics
          def statistics
            context.statistics
          end

          ##
          # Access the task_channels
          # @return [task_channels] task_channels
          def task_channels
            context.task_channels
          end

          ##
          # Provide a user friendly representation
          def to_s
            values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Taskrouter.V1.WorkspaceInstance #{values}>"
          end
        end
      end
    end
  end
end