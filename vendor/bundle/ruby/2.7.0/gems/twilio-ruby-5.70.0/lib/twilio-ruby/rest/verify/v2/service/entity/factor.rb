##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Verify < Domain
      class V2 < Version
        class ServiceContext < InstanceContext
          class EntityContext < InstanceContext
            ##
            # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
            class FactorList < ListResource
              ##
              # Initialize the FactorList
              # @param [Version] version Version that contains the resource
              # @param [String] service_sid The unique SID identifier of the Service.
              # @param [String] identity Customer unique identity for the Entity owner of the
              #   Factor. This identifier should be immutable, not PII, length between 8 and 64
              #   characters, and generated by your external system, such as your user's UUID,
              #   GUID, or SID. It can only contain dash (-) separated alphanumeric characters.
              # @return [FactorList] FactorList
              def initialize(version, service_sid: nil, identity: nil)
                super(version)

                # Path Solution
                @solution = {service_sid: service_sid, identity: identity}
                @uri = "/Services/#{@solution[:service_sid]}/Entities/#{@solution[:identity]}/Factors"
              end

              ##
              # Lists FactorInstance records from the API as a list.
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
              # Streams FactorInstance records from the API as an Enumerable.
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
              # When passed a block, yields FactorInstance records from the API.
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
              # Retrieve a single page of FactorInstance records from the API.
              # Request is executed immediately.
              # @param [String] page_token PageToken provided by the API
              # @param [Integer] page_number Page Number, this value is simply for client state
              # @param [Integer] page_size Number of records to return, defaults to 50
              # @return [Page] Page of FactorInstance
              def page(page_token: :unset, page_number: :unset, page_size: :unset)
                params = Twilio::Values.of({
                    'PageToken' => page_token,
                    'Page' => page_number,
                    'PageSize' => page_size,
                })

                response = @version.page('GET', @uri, params: params)

                FactorPage.new(@version, response, @solution)
              end

              ##
              # Retrieve a single page of FactorInstance records from the API.
              # Request is executed immediately.
              # @param [String] target_url API-generated URL for the requested results page
              # @return [Page] Page of FactorInstance
              def get_page(target_url)
                response = @version.domain.request(
                    'GET',
                    target_url
                )
                FactorPage.new(@version, response, @solution)
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Verify.V2.FactorList>'
              end
            end

            ##
            # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
            class FactorPage < Page
              ##
              # Initialize the FactorPage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @return [FactorPage] FactorPage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of FactorInstance
              # @param [Hash] payload Payload response from the API
              # @return [FactorInstance] FactorInstance
              def get_instance(payload)
                FactorInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    identity: @solution[:identity],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Verify.V2.FactorPage>'
              end
            end

            ##
            # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
            class FactorContext < InstanceContext
              ##
              # Initialize the FactorContext
              # @param [Version] version Version that contains the resource
              # @param [String] service_sid The unique SID identifier of the Service.
              # @param [String] identity Customer unique identity for the Entity owner of the
              #   Factor. This identifier should be immutable, not PII, length between 8 and 64
              #   characters, and generated by your external system, such as your user's UUID,
              #   GUID, or SID. It can only contain dash (-) separated alphanumeric characters.
              # @param [String] sid A 34 character string that uniquely identifies this Factor.
              # @return [FactorContext] FactorContext
              def initialize(version, service_sid, identity, sid)
                super(version)

                # Path Solution
                @solution = {service_sid: service_sid, identity: identity, sid: sid, }
                @uri = "/Services/#{@solution[:service_sid]}/Entities/#{@solution[:identity]}/Factors/#{@solution[:sid]}"
              end

              ##
              # Delete the FactorInstance
              # @return [Boolean] true if delete succeeds, false otherwise
              def delete
                 @version.delete('DELETE', @uri)
              end

              ##
              # Fetch the FactorInstance
              # @return [FactorInstance] Fetched FactorInstance
              def fetch
                payload = @version.fetch('GET', @uri)

                FactorInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    identity: @solution[:identity],
                    sid: @solution[:sid],
                )
              end

              ##
              # Update the FactorInstance
              # @param [String] auth_payload The optional payload needed to verify the Factor
              #   for the first time. E.g. for a TOTP, the numeric code.
              # @param [String] friendly_name The new friendly name of this Factor. It can be up
              #   to 64 characters.
              # @param [String] config_notification_token For APN, the device token. For FCM,
              #   the registration token. It is used to send the push notifications. Required when
              #   `factor_type` is `push`. If specified, this value must be between 32 and 255
              #   characters long.
              # @param [String] config_sdk_version The Verify Push SDK version used to configure
              #   the factor
              # @param [String] config_time_step Defines how often, in seconds, are TOTP codes
              #   generated. i.e, a new TOTP code is generated every time_step seconds. Must be
              #   between 20 and 60 seconds, inclusive
              # @param [String] config_skew The number of time-steps, past and future, that are
              #   valid for validation of TOTP codes. Must be between 0 and 2, inclusive
              # @param [String] config_code_length Number of digits for generated TOTP codes.
              #   Must be between 3 and 8, inclusive
              # @param [factor.TotpAlgorithms] config_alg The algorithm used to derive the TOTP
              #   codes. Can be `sha1`, `sha256` or `sha512`
              # @param [String] config_notification_platform The transport technology used to
              #   generate the Notification Token. Can be `apn`, `fcm` or `none`.
              #
              #   Required when `factor_type` is `push`.
              # @return [FactorInstance] Updated FactorInstance
              def update(auth_payload: :unset, friendly_name: :unset, config_notification_token: :unset, config_sdk_version: :unset, config_time_step: :unset, config_skew: :unset, config_code_length: :unset, config_alg: :unset, config_notification_platform: :unset)
                data = Twilio::Values.of({
                    'AuthPayload' => auth_payload,
                    'FriendlyName' => friendly_name,
                    'Config.NotificationToken' => config_notification_token,
                    'Config.SdkVersion' => config_sdk_version,
                    'Config.TimeStep' => config_time_step,
                    'Config.Skew' => config_skew,
                    'Config.CodeLength' => config_code_length,
                    'Config.Alg' => config_alg,
                    'Config.NotificationPlatform' => config_notification_platform,
                })

                payload = @version.update('POST', @uri, data: data)

                FactorInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    identity: @solution[:identity],
                    sid: @solution[:sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Verify.V2.FactorContext #{context}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Verify.V2.FactorContext #{context}>"
              end
            end

            ##
            # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
            class FactorInstance < InstanceResource
              ##
              # Initialize the FactorInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] service_sid The unique SID identifier of the Service.
              # @param [String] identity Customer unique identity for the Entity owner of the
              #   Factor. This identifier should be immutable, not PII, length between 8 and 64
              #   characters, and generated by your external system, such as your user's UUID,
              #   GUID, or SID. It can only contain dash (-) separated alphanumeric characters.
              # @param [String] sid A 34 character string that uniquely identifies this Factor.
              # @return [FactorInstance] FactorInstance
              def initialize(version, payload, service_sid: nil, identity: nil, sid: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'sid' => payload['sid'],
                    'account_sid' => payload['account_sid'],
                    'service_sid' => payload['service_sid'],
                    'entity_sid' => payload['entity_sid'],
                    'identity' => payload['identity'],
                    'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                    'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                    'friendly_name' => payload['friendly_name'],
                    'status' => payload['status'],
                    'factor_type' => payload['factor_type'],
                    'config' => payload['config'],
                    'metadata' => payload['metadata'],
                    'url' => payload['url'],
                }

                # Context
                @instance_context = nil
                @params = {'service_sid' => service_sid, 'identity' => identity, 'sid' => sid || @properties['sid'], }
              end

              ##
              # Generate an instance context for the instance, the context is capable of
              # performing various actions.  All instance actions are proxied to the context
              # @return [FactorContext] FactorContext for this FactorInstance
              def context
                unless @instance_context
                  @instance_context = FactorContext.new(
                      @version,
                      @params['service_sid'],
                      @params['identity'],
                      @params['sid'],
                  )
                end
                @instance_context
              end

              ##
              # @return [String] A string that uniquely identifies this Factor.
              def sid
                @properties['sid']
              end

              ##
              # @return [String] Account Sid.
              def account_sid
                @properties['account_sid']
              end

              ##
              # @return [String] Service Sid.
              def service_sid
                @properties['service_sid']
              end

              ##
              # @return [String] Entity Sid.
              def entity_sid
                @properties['entity_sid']
              end

              ##
              # @return [String] Unique external identifier of the Entity
              def identity
                @properties['identity']
              end

              ##
              # @return [Time] The date this Factor was created
              def date_created
                @properties['date_created']
              end

              ##
              # @return [Time] The date this Factor was updated
              def date_updated
                @properties['date_updated']
              end

              ##
              # @return [String] A human readable description of this resource.
              def friendly_name
                @properties['friendly_name']
              end

              ##
              # @return [factor.FactorStatuses] The Status of this Factor
              def status
                @properties['status']
              end

              ##
              # @return [factor.FactorTypes] The Type of this Factor
              def factor_type
                @properties['factor_type']
              end

              ##
              # @return [Hash] Configurations for a `factor_type`.
              def config
                @properties['config']
              end

              ##
              # @return [Hash] Metadata of the factor.
              def metadata
                @properties['metadata']
              end

              ##
              # @return [String] The URL of this resource.
              def url
                @properties['url']
              end

              ##
              # Delete the FactorInstance
              # @return [Boolean] true if delete succeeds, false otherwise
              def delete
                context.delete
              end

              ##
              # Fetch the FactorInstance
              # @return [FactorInstance] Fetched FactorInstance
              def fetch
                context.fetch
              end

              ##
              # Update the FactorInstance
              # @param [String] auth_payload The optional payload needed to verify the Factor
              #   for the first time. E.g. for a TOTP, the numeric code.
              # @param [String] friendly_name The new friendly name of this Factor. It can be up
              #   to 64 characters.
              # @param [String] config_notification_token For APN, the device token. For FCM,
              #   the registration token. It is used to send the push notifications. Required when
              #   `factor_type` is `push`. If specified, this value must be between 32 and 255
              #   characters long.
              # @param [String] config_sdk_version The Verify Push SDK version used to configure
              #   the factor
              # @param [String] config_time_step Defines how often, in seconds, are TOTP codes
              #   generated. i.e, a new TOTP code is generated every time_step seconds. Must be
              #   between 20 and 60 seconds, inclusive
              # @param [String] config_skew The number of time-steps, past and future, that are
              #   valid for validation of TOTP codes. Must be between 0 and 2, inclusive
              # @param [String] config_code_length Number of digits for generated TOTP codes.
              #   Must be between 3 and 8, inclusive
              # @param [factor.TotpAlgorithms] config_alg The algorithm used to derive the TOTP
              #   codes. Can be `sha1`, `sha256` or `sha512`
              # @param [String] config_notification_platform The transport technology used to
              #   generate the Notification Token. Can be `apn`, `fcm` or `none`.
              #
              #   Required when `factor_type` is `push`.
              # @return [FactorInstance] Updated FactorInstance
              def update(auth_payload: :unset, friendly_name: :unset, config_notification_token: :unset, config_sdk_version: :unset, config_time_step: :unset, config_skew: :unset, config_code_length: :unset, config_alg: :unset, config_notification_platform: :unset)
                context.update(
                    auth_payload: auth_payload,
                    friendly_name: friendly_name,
                    config_notification_token: config_notification_token,
                    config_sdk_version: config_sdk_version,
                    config_time_step: config_time_step,
                    config_skew: config_skew,
                    config_code_length: config_code_length,
                    config_alg: config_alg,
                    config_notification_platform: config_notification_platform,
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Verify.V2.FactorInstance #{values}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Verify.V2.FactorInstance #{values}>"
              end
            end
          end
        end
      end
    end
  end
end