# frozen_string_literal: true

module RelicLink
  module Coh3
    module Api
      module Endpoints
        module Leaderboards
          # Various leaderboard IDs provided for convenience. Best effort
          # will be made to ensure these IDs are accurate and up-to-date,
          # but it's possible Relic changes them in the future. If you
          # really want to be sure you have accurate IDs, call
          # {#available_leaderboards}.
          module Ids
            AMERICAN_1V1 = 2130255
            AMERICAN_1V1_UNRANKED = 2130256
            AMERICAN_2V2 = 2130300
            AMERICAN_2V2_UNRANKED = 2130301
            AMERICAN_2V2_EASY_AI = 2130283
            AMERICAN_2V2_MEDIUM_AI = 2130296
            AMERICAN_2V2_HARD_AI = 2130291
            AMERICAN_2V2_EXPERT_AI = 2130287
            AMERICAN_3V3 = 2130329
            AMERICAN_3V3_UNRANKED = 2130330
            AMERICAN_3V3_EASY_AI = 2130308
            AMERICAN_3V3_MEDIUM_AI = 2130325
            AMERICAN_3V3_HARD_AI = 2130320
            AMERICAN_3V3_EXPERT_AI = 2130313
            AMERICAN_4V4 = 2130353
            AMERICAN_4V4_UNRANKED = 2130354
            AMERICAN_4V4_EASY_AI = 2130337
            AMERICAN_4V4_MEDIUM_AI = 2130349
            AMERICAN_4V4_HARD_AI = 2130345
            AMERICAN_4V4_EXPERT_AI = 2130341

            BRITISH_1V1 = 2130257
            BRITISH_1V1_UNRANKED = 2130258
            BRITISH_2V2 = 2130302
            BRITISH_2V2_UNRANKED = 2130303
            BRITISH_2V2_EASY_AI = 2130284
            BRITISH_2V2_MEDIUM_AI = 2130297
            BRITISH_2V2_HARD_AI = 2130293
            BRITISH_2V2_EXPERT_AI = 2130288
            BRITISH_3V3 = 2130331
            BRITISH_3V3_UNRANKED = 2130332
            BRITISH_3V3_EASY_AI = 2130309
            BRITISH_3V3_MEDIUM_AI = 2130326
            BRITISH_3V3_HARD_AI = 2130321
            BRITISH_3V3_EXPERT_AI = 2130317
            BRITISH_4V4 = 2130356
            BRITISH_4V4_UNRANKED = 2130357
            BRITISH_4V4_EASY_AI = 2130338
            BRITISH_4V4_MEDIUM_AI = 2130350
            BRITISH_4V4_HARD_AI = 2130346
            BRITISH_4V4_EXPERT_AI = 2130342

            WEHRMACHT_1V1 = 2130261
            WEHRMACHT_1V1_UNRANKED = 2130262
            WEHRMACHT_2V2 = 2130306
            WEHRMACHT_2V2_UNRANKED = 2130307
            WEHRMACHT_2V2_EASY_AI = 2130286
            WEHRMACHT_2V2_MEDIUM_AI = 2130299
            WEHRMACHT_2V2_HARD_AI = 2130295
            WEHRMACHT_2V2_EXPERT_AI = 2130290
            WEHRMACHT_3V3 = 2130335
            WEHRMACHT_3V3_UNRANKED = 2130336
            WEHRMACHT_3V3_EASY_AI = 2130311
            WEHRMACHT_3V3_MEDIUM_AI = 2130328
            WEHRMACHT_3V3_HARD_AI = 2130323
            WEHRMACHT_3V3_EXPERT_AI = 2130319
            WEHRMACHT_4V4 = 2130360
            WEHRMACHT_4V4_UNRANKED = 2130361
            WEHRMACHT_4V4_EASY_AI = 2130340
            WEHRMACHT_4V4_MEDIUM_AI = 2130352
            WEHRMACHT_4V4_HARD_AI = 2130348
            WEHRMACHT_4V4_EXPERT_AI = 2130344

            DAK_1V1 = 2130259
            DAK_1V1_UNRANKED = 2130260
            DAK_2V2 = 2130304
            DAK_2V2_UNRANKED = 2130305
            DAK_2V2_EASY_AI = 2130285
            DAK_2V2_MEDIUM_AI = 2130298
            DAK_2V2_HARD_AI = 2130294
            DAK_2V2_EXPERT_AI = 2130289
            DAK_3V3 = 2130333
            DAK_3V3_UNRANKED = 2130334
            DAK_3V3_EASY_AI = 2130310
            DAK_3V3_MEDIUM_AI = 2130327
            DAK_3V3_HARD_AI = 2130322
            DAK_3V3_EXPERT_AI = 2130318
            DAK_4V4 = 2130358
            DAK_4V4_UNRANKED = 2130359
            DAK_4V4_EASY_AI = 2130339
            DAK_4V4_MEDIUM_AI = 2130351
            DAK_4V4_HARD_AI = 2130347
            DAK_4V4_EXPERT_AI = 2130343

            CUSTOM = 2130362
          end
        end
      end
    end
  end
end
