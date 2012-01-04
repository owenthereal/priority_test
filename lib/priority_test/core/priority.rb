module PriorityTest
  module Core
    module Priority
      PRIORITY_SET_RANKINGS = {
        "FFFFF" => 1,
        "FFFFP" => 2,
        "FFFPF" => 3,
        "FFFPP" => 4,

        "FFPFF" => 5,
        "FFPFP" => 6,
        "FFPPF" => 7,
        "FFPPP" => 8,

        "FPFFF" => 9,
        "FPFFP" => 10,
        "FPFPF" => 11,
        "FPFPP" => 12,

        "FPPFF" => 13,
        "FPPFP" => 14,
        "FPPPF" => 15,
        "FPPPP" => 16,

        "PFFFF" => 17,
        "PFFFP" => 18,
        "PFFPF" => 19,
        "PFFPP" => 20,

        "PFPFF" => 21,
        "PFPFP" => 22,
        "PFPPF" => 23,
        "PFPPP" => 24,
      }

      NON_PRIORITY_SET_RANKINGS = {
        "PPFFF" => 25,
        "PPFFP" => 26,
        "PPFPF" => 27,
        "PPFPP" => 28,

        "PPPFF" => 29,
        "PPPFP" => 30,
        "PPPPF" => 31,
        "PPPPP" => 32
      }

      # ranking for the last 5 test results
      PRIORITY_RANKINGS = PRIORITY_SET_RANKINGS.merge(NON_PRIORITY_SET_RANKINGS)

      PRIORITY_THRESHOLD = 24

      def self.[](key)
        PRIORITY_RANKINGS[key]
      end
    end
  end
end
