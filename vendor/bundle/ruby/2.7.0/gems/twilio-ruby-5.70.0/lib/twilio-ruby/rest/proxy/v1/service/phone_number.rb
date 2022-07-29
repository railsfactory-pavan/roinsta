##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Proxy < Domain
      class V1 < Version
        class ServiceContext < InstanceContext
          ##
          # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
          class PhoneNumberList < ListResource
            ##
            # Initialize the PhoneNumberList
            # @param [Version] version Version that contains the resource
            # @param [String] service_sid The SID of the PhoneNumber resource's parent
            #   {Service}[https://www.twilio.com/docs/proxy/api/service] resource.
            # @return [PhoneNumberList] PhoneNumberList
            def initialize(version, service_sid: nil)
              super(version)

              # Path Solution
              @solution = {service_sid: service_sid}
              @uri = "/Services/#{@solution[:service_sid]}/PhoneNumbers"
            end

            ##
            # Create the PhoneNumberInstance
            # @param [String] sid The SID of a Twilio
            #   {IncomingPhoneNumber}[https://www.twilio.com/docs/phone-numbers/api/incomingphonenumber-resource]
            #   resource that represents the Twilio Number you would like to assign to your
            #   Proxy Service.
            # @param [String] phone_number The phone number in
            #   {E.164}[https://www.twilio.com/docs/glossary/what-e164] format.  E.164 phone
            #   numbers consist of a + followed by the country code and subscriber number
            #   without punctuation characters. For example, +14155551234.
            # @param [Boolean] is_reserved Whether the new phone number should be reserved and
            #   not be assigned to a participant using proxy pool logic. See {Reserved Phone
            #   Numbers}[https://www.twilio.com/docs/proxy/reserved-phone-numbers] for more
            #   information.
            # @return [PhoneNumberInstance] Created PhoneNumberInstance
            def create(sid: :unset, phone_number: :unset, is_reserved: :unset)
              data = Twilio::Values.of({'Sid' => sid, 'PhoneNumber' => phone_number, 'IsReserved' => is_reserved, })

              payload = @version.create('POST', @uri, data: data)

              PhoneNumberInstance.new(@version, payload, service_sid: @solution[:service_sid], )
            end

            ##
            # Lists PhoneNumberInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records.  If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Array] Array of up to limit results
            def list(limit: nil, page_size: nil)
              self.stream(limit: limit, page_size: page_size).entries
            end

            ##
            # Streams PhoneNumberInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit. Default is no limit.
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records. If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)

              page = self.page(page_size: limits[:page_size], )

              @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
            end

            ##
            # When passed a block, yields PhoneNumberInstance records from the API.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            def each
              limits = @version.read_limits

              page = self.page(page_size: limits[:page_size], )

              @version.stream(page,
                              limit: limits[:limit],
                              page_limit: limits[:page_limit]).each {|x| yield x}
            end

            ##
            # Retrieve a single page of PhoneNumberInstance records from the API.
            # Request is executed immediately.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of PhoneNumberInstance
            def page(page_token: :unset, page_number: :unset, page_size: :unset)
              params = Twilio::Values.of({
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              })

              response = @version.page('GET', @uri, params: params)

              PhoneNumberPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of PhoneNumberInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of PhoneNumberInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              PhoneNumberPage.new(@version, response, @solution)
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Proxy.V1.PhoneNumberList>'
            end
          end

          ##
          # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
          class PhoneNumberPage < Page
            ##
            # Initialize the PhoneNumberPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [PhoneNumberPage] PhoneNumberPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of PhoneNumberInstance
            # @param [Hash] payload Payload response from the API
            # @return [PhoneNumberInstance] PhoneNumberInstance
            def get_instance(payload)
              PhoneNumberInstance.new(@version, payload, service_sid: @solution[:service_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Proxy.V1.PhoneNumberPage>'
            end
          end

          ##
          # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
          class PhoneNumberContext < InstanceContext
            ##
            # Initialize the PhoneNumberContext
            # @param [Version] version Version that contains the resource
            # @param [String] service_sid The SID of the parent
            #   {Service}[https://www.twilio.com/docs/proxy/api/service] of the PhoneNumber
            #   resource to fetch.
            # @param [String] sid The Twilio-provided string that uniquely identifies the
            #   PhoneNumber resource to fetch.
            # @return [PhoneNumberContext] PhoneNumberContext
            def initialize(version, service_sid, sid)
              super(version)

              # Path Solution
              @solution = {service_sid: service_sid, sid: sid, }
              @uri = "/Services/#{@solution[:service_sid]}/PhoneNumbers/#{@solution[:sid]}"
            end

            ##
            # Delete the PhoneNumberInstance
            # @return [Boolean] true if delete succeeds, false otherwise
            def delete
               @version.delete('DELETE', @uri)
            end

            ##
            # Fetch the PhoneNumberInstance
            # @return [PhoneNumberInstance] Fetched PhoneNumberInstance
            def fetch
              payload = @version.fetch('GET', @uri)

              PhoneNumberInstance.new(
                  @version,
                  payload,
                  service_sid: @solution[:service_sid],
                  sid: @solution[:sid],
              )
            end

            ##
            # Update the PhoneNumberInstance
            # @param [Boolean] is_reserved Whether the phone number should be reserved and not
            #   be assigned to a participant using proxy pool logic. See {Reserved Phone
            #   Numbers}[https://www.twilio.com/docs/proxy/reserved-phone-numbers] for more
            #   information.
            # @return [PhoneNumberInstance] Updated PhoneNumberInstance
            def update(is_reserved: :unset)
              data = Twilio::Values.of({'IsReserved' => is_reserved, })

              payload = @version.update('POST', @uri, data: data)

              PhoneNumberInstance.new(
                  @version,
                  payload,
                  service_sid: @solution[:service_sid],
                  sid: @solution[:sid],
              )
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Proxy.V1.PhoneNumberContext #{context}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Proxy.V1.PhoneNumberContext #{context}>"
            end
          end

          ##
          # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
          class PhoneNumberInstance < InstanceResource
            ##
            # Initialize the PhoneNumberInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] service_sid The SID of the PhoneNumber resource's parent
            #   {Service}[https://www.twilio.com/docs/proxy/api/service] resource.
            # @param [String] sid The Twilio-provided string that uniquely identifies the
            #   PhoneNumber resource to fetch.
            # @return [PhoneNumberInstance] PhoneNumberInstance
            def initialize(version, payload, service_sid: nil, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'sid' => payload['sid'],
                  'account_sid' => payload['account_sid'],
                  'service_sid' => payload['service_sid'],
                  'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                  'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                  'phone_number' => payload['phone_number'],
                  'friendly_name' => payload['friendly_name'],
                  'iso_country' => payload['iso_country'],
                  'capabilities' => payload['capabilities'],
                  'url' => payload['url'],
                  'is_reserved' => payload['is_reserved'],
                  'in_use' => payload['in_use'].to_i,
              }

              # Context
              @instance_context = nil
              @params = {'service_sid' => service_sid, 'sid' => sid || @properties['sid'], }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [PhoneNumberContext] PhoneNumberContext for this PhoneNumberInstance
            def context
              unless @instance_context
                @instance_context = PhoneNumberContext.new(@version, @params['service_sid'], @params['sid'], )
              end
              @instance_context
            end

            ##
            # @return [String] The unique string that identifies the resource
            def sid
              @properties['sid']
            end

            ##
            # @return [String] The SID of the Account that created the resource
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [String] The SID of the PhoneNumber resource's parent Service resource
            def service_sid
              @properties['service_sid']
            end

            ##
            # @return [Time] The ISO 8601 date and time in GMT when the resource was created
            def date_created
              @properties['date_created']
            end

            ##
            # @return [Time] The ISO 8601 date and time in GMT when the resource was last updated
            def date_updated
              @properties['date_updated']
            end

            ##
            # @return [String] The phone number in E.164 format
            def phone_number
              @properties['phone_number']
            end

            ##
            # @return [String] The string that you assigned to describe the resource
            def friendly_name
              @properties['friendly_name']
            end

            ##
            # @return [String] The ISO Country Code
            def iso_country
              @properties['iso_country']
            end

            ##
            # @return [String] The capabilities of the phone number
            def capabilities
              @properties['capabilities']
            end

            ##
            # @return [String] The absolute URL of the PhoneNumber resource
            def url
              @properties['url']
            end

            ##
            # @return [Boolean] Reserve the phone number for manual assignment to participants only
            def is_reserved
              @properties['is_reserved']
            end

            ##
            # @return [String] The number of open session assigned to the number.
            def in_use
              @properties['in_use']
            end

            ##
            # Delete the PhoneNumberInstance
            # @return [Boolean] true if delete succeeds, false otherwise
            def delete
              context.delete
            end

            ##
            # Fetch the PhoneNumberInstance
            # @return [PhoneNumberInstance] Fetched PhoneNumberInstance
            def fetch
              context.fetch
            end

            ##
            # Update the PhoneNumberInstance
            # @param [Boolean] is_reserved Whether the phone number should be reserved and not
            #   be assigned to a participant using proxy pool logic. See {Reserved Phone
            #   Numbers}[https://www.twilio.com/docs/proxy/reserved-phone-numbers] for more
            #   information.
            # @return [PhoneNumberInstance] Updated PhoneNumberInstance
            def update(is_reserved: :unset)
              context.update(is_reserved: is_reserved, )
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Proxy.V1.PhoneNumberInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Proxy.V1.PhoneNumberInstance #{values}>"
            end
          end
        end
      end
    end
  end
end