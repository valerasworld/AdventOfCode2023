import UIKit

class PipeMaze {
    
    // Test cases:
    var shortInput: String {
        let input =
        """
        -L|F7
        7S-7|
        L|7||
        -L-J|
        L|-JF
        """
        return input
    }
    var shortInput2: String {
        let input =
        """
        ..F7.
        .FJ|.
        SJ.L7
        |F--J
        LJ...
        """
        return input
    }
    var longInput: String {
        let input =
        """
        F7F.7-7FF77|7.|-7-7-.|7F-7-|7-.|-FJ-.L7-J.F7..F---F-7-FF777.L7.FJ---.FFF|--7F-JF--.|J-|F-.LL7FFF7-JFJ--F-7L|7.J-L7FF-F7F|7-FFL7-L.--J77--F|7
        |-L.|L|--JLL7FLFL.|-J||J||-L7..F-|.LFJL7|7L|-JJ...L--F7|L7FFJ---|J-L7-JJ|.LL|.|-L.L7|.||-7|.|L7J7F-J.7-JL|JL7FJ|.J7-LL-7|LFL|L-7L-F-FJLL-||J
        -.LFL-JF|-|.L7F|...F7JL-J|-LL-FL7L7F7|.-J-FJ-7JF|.F-||||FJF77F|7F-7||-7F-..|.FJ|.F7LL--7.7-7|77L|7-7LF77FJF-.|.F|LJ-7.L.7FFF|-L7..J.JL77..LF
        |LJL|7FF|FJ.JJ7|F77F7-F7LJ..L7LF--JFF-7.LLF7LJ.-LFF--JLJL7|L7-F-FJ-|LFL7FJF7-JJ7L.F7|..|FJFLLLF7-JL7JL7-L77.F-J7JF||LJFFL|F-J--L-7JFJL-7-|7|
        7.FFJ|FL.L.LLLF7.FF.J-7J7.FL-L7-L.F-J||FF.|J|L-.LFL----7FJ|FJJJ-L-7|L|--|J7F77J|..F|-.FJJ--..L7LJ7.|7JL7L|7-|7L7-L-7LJ7LLLJJ|.LJLF77-F-|L-77
        |7-LF-J.FL|.7-LJF-JFL7|.|7J7LL-J-77.F|-7LF-.F|JFFLJJJF-JL-JL7J.LLL|F-FJ-|||LJJ-LF7J|JL-J|J--J-|.|F|-F77LJLJ-LJ-7-J|.-LJF-.J.FJ.|FLL7--7JLL|J
        LJ..LF7-FJ|-L--7LJF7.LJF||JF7.J77||FFJ||7.|--J.LLJLL|L-7F7F-J77F7LLL7|LF|7|F|JF||J.F77FFF-7|J.|.F7F77-JL7-|J.JJJ|F-7|7FL.F..---7.|.7J.LL7.|L
        L-7-LL|L|.|.|.LL.FJ7-JLF-77-J-JLF7LFF-FLF-7.|LFJLFFF7F7||||F7.FLL7J|L--7L7-7-.FL-7-|L7FF|FJJ.F7F|LJL77.F|.|7FL-F77-7J-JJF|--J.|FL-J|FF-.-F7|
        ||L-JLJ7J|.|77.L7.L--J-|J.77LJFFJL7JL-FJ|-77JF|7|F-J||LJ|LJ||7FJLJ--J|.F.JJ|L-F7|L7L7L7FJL7.F||FJF--JF-J.FJFJJLJL7.L|LJL7||.F|-|L||7FL77JL|F
        -F7|J.FJ|F7||7..L-.|.FJ|.|.LF.FJF-JJ.F|.|7F77-|J7L-7LJF7L--JL-7J7LL|..LL-.LJ7|LL-JFL|FJ|F-J-FJ|L7L77.|LL7LF|J-|F7L-7|77F|J---JFJJL77JF--7.FJ
        LJ|J.F|7L|L|.|L.|FFF--LF--7.|FL7||J-FLF-7-||F-7-LJ|L--J|F-----JL-7FLJ7.|J--L-L..F7F|||FJL--7|FJ.|FJF-7.LJJ||FF77.7|||-|-|JF|JFJ7.L|J-7JF|FJ|
        LFLJ.7L|||F--7F--L7J|..L-7|F7F-JL-7.FLL7|L|LJFJ|.F7F7F-JL7F7FF77LF-7F77||L|.J.L7LF--J|L7F--J|L7FJL-JFJ7.|FF-F7JF77-|..|.JF7F7.||-L|F-J7||J7F
        7.F.J-FJ-J-LL-FJ|.|F-LF--JLJ||F---J-7|F|L7|F-J|FFJ|||L-7FJ|L7|L777F77L--F.|-|7J|JL--7L7||7F7|FJL7F7FJJ|F7FJ.FF-JL-7.F-F7|-||7--F-7LFJLLL-.FJ
        |.L7J-7J7||||LJ-FF7F7LL----7|||F-7.|F-7L7LJ|F--7L7LJ|F7|L7|FJL7|F-7JF7L7L77FF-7F77F-JFJ|L7|||L-7|||L7.LF7J.7.|F7F-J7|F-JJ--.||LL7J.7--J7|F-7
        |7JL-|LL7-J-7-FFFJLJ|7F7F-7|LJLJFJ7FJFJJL7FJL-7L7L-7||LJFJ|L7FJ|L7|JF77JF-7-L7LJ|FJF7|FJFJ|||F-J||L-J7|||LF|-LJ|L-7F7J|..7J77LFJJFL--|.J7|FL
        |--..FF-J7|||.LFL7F7L-JLJFJL-7F-JJFL7|F7L|||F7|FJF-J|L-7L-JFJL7|FJL7||J.|FJ7FJF7|L-J||L7|FJ|||F7|L7F7.F||-|F-7|L7FJ||.F7F7-7--JLF--J|LFLJF-J
        L7J.FFF-L|-7F7-7.LJL----7L-7FJ|F7LF-JL7F7|L-J||L7L-7L7J|F--JF-J|L-7LJL-7||F7L7|LJF7FJL7||L7||||||FJ||F7||F7|FJF-JL-JL-J|||7L||.|F77LL7||.||7
        F77FF-|...LFJF7|FF------JF-JL7||L7L-7FJ||L--7||FJF7L7L-JL-7FJF-JF-JF---J||||FJL7FJ|L7FJ||FJLJ||LJL-J||||||||L7|F-7F----J|L7F7J7|JF7.F|7LLL.|
        FJLFL7|7F|LLFJLLFL------7L7F7|LJFJF7||FJ|F77||||FJ|JL--7F-J|FJF7L-7|F-7FJ|||L7FJL7L7|L7||L-7FJ|F----J|LJLJLJFJ|L7LJ.F--7|FJ||.FJ7LJ7-J|F|7L|
        7-F|.JJ7LJJ||.LJJ|.F7FF7|FJ||L-7L7|||||FJ|L7|LJLJFJF7F-J|F7||||L7FJLJFJL7||L-JL7LL7||FJ||F7||FJL7F-7LL-----7L-JFJF7FJF-J|L-JL-7-F7LL.FLLJJLJ
        F---F-F|FJ.J--F|-F-JL-J||L7|L-7L7LJLJ||L7|FJL-7F-JFJ|L-7||||L7|FJ|F--J7F||L7F-7|F7|LJ|FJ||LJLJF7||FJF--7|F-JF--JFJ|L7|F7|F----J.L7-J7..J.|.|
        L7LJJFFJLFJ7|.L.FL7F--7|L7|L-7|FJF---J|FJ||-F-JL-7L7|F-J||||FJ|L-J|F--7FJ|-LJFJ|||L-7||FJ|F-7FJ|||L7L-7L7L-7|F7L|FJFJLJLJL-----7L-7LF-FJ.|F7
        .L77.LF7LJ-LLF7FF.||F-JL7|L--J|L7L7F7FJ|F|L7L-7F-JFJ|L-7LJLJL-JF--J|F-JL7|F7FJFJ||F7|LJL-JL7LJ|LJL7L-7L7|F-JLJL7||FJF7F---7F--7|-L7.|7|.J7-.
        |JL-L-7F|J|L|.F--FLJL7F7LJF7F7L-JFJ||L7L7L7|F7|L7FJFJF7L-7F----JLF7|L-7FJ|||L7L7|LJ|L----7FJ.F7|F7|F7L-J|L7F-7FJ|LJFJLJ-F7LJ7.LJ.L|.L|-J|LJ7
        |.JJ.F|-F-|7|LF-|F-7L|||F7|LJL7F7L7||FJFJ-|||||FJL7L7|L--JL7F7|F7|LJF-JL7|||JL7|L7FJF--7FJL7FJL7||LJL--7L7LJFJL7|F-JJF-7||F7F77J|.|F.|L|-|.7
        ||J7FFLJLJ..|J.LFL7L-J|LJLJF-7LJ|FJ||L7|F-JLJ||L7FJFJL---7FJ|L-JLJF-JFF7|LJL7-||FJ|FJF-JL-7LJF-J|||F--7|FJF-JF-J|L7F7L7LJ||LJL7F7F7J.F7F-J7L
        -.FJF--F-.|7L-7-7-L7F-JF---JFJF-JL7||FJ|L--7FJ|FJL7|F77F7|L7|F----JF7FJ|L--7|FJ||FJ|FJF7F-JF-JF7|L7L-7LJL-JF-JF7|FJ|L7|F-JL7F-J||||F7|L-J.FJ
        |-7L|J-F-LLJ7J|JL7|LJF7L---7L7L--7LJ|L7|F--JL-JL-7||||FJ||FJ||F7F7FJ||FJF77||L7||L7|L7||L-7L-7|||FJF7L----7L-7||||7L7||L-7J||F7|||LJL777-L7J
        ||J7.|7LFLF7F7|----F-JL---7L7L--7L-7||||L--7F7F--J|LJ|L7|||FJLJ|||L7|||FJ|FJL-J||FJ|FJ||F7|F-J||||FJ|F7F--JF7LJLJL7FJLJF-JFJLJLJLJF7FJJ-77|7
        LLJLF-JF|7|L77JJ.L|L-----7||L--7L--J|FJ|F7.LJ|L-7FL7FJL|||||F-7||L7|||||FJL---7LJ|FJL7|LJ||L7FJ||||FJ||L---JL-7F--J|F--JF-JF-7F-7FJLJJ-FJF|-
        J7|L-J-|-7-7J.F.F77JF7.F7||F7F7L---7|L7LJL7F-JF-JF7|L-7|||LJL7LJL7LJ||LJL-7F--JF-JL7FJL-7||FJ|FJ|||L7||F7F7F7FJL--7|L-7FJF7L7|L7|L-7|||||L7J
        LFFJ|FF|.|LL7FF-JL-7||FJLJLJLJL--7FJL7L7F-JL-7|F-J|L7FJ||L--7L7F7L-7||F---JL--7|-F-JL7F7|||L-JL7|LJFJ|LJLJ||LJF7F7LJF-J|FJL-JL-JL--JJ7LJ7J||
        7LJ7F77.F7.L77L---7|||L---------7|L7FJFJL7.F7|||F-JFJ|FJL7F-JFJ||F7||||F7-F7.FJL7L-7FJ|||LJF---JL-7L7L--7FJL7FJLJL7FJF-JL---------7JFF|-|.LJ
        |-F-J7-7L-7JLF--7FJLJL-------7F7|L7|L7L-7L7|||||L7FJFJ|F-JL-7L-J||||||||L7|L7L-7L7FJL7||L-7L7F7F7.L7L-7FJ|LFJL-7.FJL-JF7F7F-------J7--|.F|.L
        |FF--JF-7F77FL-7LJF--7F-----7LJ|L7||FJF7|FJ|||||FJL7|L||F7F7|F--J||||||L7||FJF7|FJ|F-J||F7|FJ||||F7|F-JL7L-JF-7L7L-7F-J|||L-----7JL7|7LJJ.J.
        L-.7.7|.-7L7FL-L-7|F-J|F----JF7L-JLJ|FJ||L7||||||F-J|FJ||||||L7F7|||||L7|||L7|LJ|FJL7FJLJ||L7||||||||F7FJF--J7L7L-7|L-7LJL------J7F-7-||.LL7
        7J7F7-LJ.F--JL7.FJ|L-7|L--7F7|L--7F7LJFJ|F||||||||F-JL7||||||FJ||||||L7LJLJFJL7FJL-7||FF7|L7||||||||||||.L----7L7FJ|F-JLF----7-F--7-F.||7J.|
        F.7.L|LJF-J-FL--L7|F-J|.F7LJLJ-F7||L-7L7L7||||LJLJL7F7|LJLJLJL7|LJLJL7L---7L7FJ|F7FJ||FJLJFJ||||LJ|||||L7F----JFLJ.LJF--JF7F7L7|F-JL|-JJ---F
        |7LJ|F7J-J|.7F|7FJ||F-JFJ|F----JLJ|F-JJL7||||L--7F7LJ|L----7F7|L-7F7JL7F--JFJL7||LJLLJL-7FJLLJLJF-J|||L-JL---7F--7F--JF7FJLJL-J|L-7-7LJ.J7FF
        J7LF7J|||F-7FFFFJFJLJF7L7LJF7F-7F7|L---7||LJ|F7FJ|L--JF-7F7||LJF7LJ|F-J|F7FJF7||L-7F7F7FJL----7FJF7|||F----7FJL7FJ|F-7|||F7F-7FJF-J--.||-F77
        F7.-J.LJJ7-7|LLL7|FF-JL-JF-J|L7LJLJF---JLJF-J||L7L-7F7L7||LJ|F7|L--J|F7||LJFJLJ|F-J|LJLJF7F7F7||FJLJLJL7F-7LJF7||FJL7LJLJ|||FJL7|J|--77L-JLF
        FL77F7.|LF7-F.FFJL7L-----JF7L-J7F--JF7F--7L7FJL7|F-J||FJ|L-7|||L---7||LJ|F7L--7||F-JF--7|LJ||||LJF7F--7LJFJF-JLJ|L7FJF-7FJ||L7FJL-7FFJ||.F|L
        F---L-||.LJ.|7LL--JF------J|F77FJF-7|LJF7L7|L-7||L-7||L7|F-JLJ|F---J||F-J||F7FJLJ|F7|F-JL-7LJ||F-J|L-7|F-JFJF--7L7||J|FJL7LJFJ|F--J7F7|L7F77
        LF7LLJ||J-FJJFLJF-7L----7F7LJL-JFJ7LJF-JL-JL7FJLJ.FJ||FJLJF---JL--7-LJL7FJ|||L7F7||LJL-7F7L-7LJL-7L--J|L-7L7L-7L7LJL7||F7|F-JL|L7F7FJL7|F-7J
        F7JLF-F7J-LJL7|.L7|FF---J|L-----JF---JF7F7F7|L7FF7L7|||F--JF7F7F-7L---7||LLJ|FJ|LJL-7F-J||F7L7|F-JF--7L-7L-JF-JFL7F7LJLJLJL7F7L7LJ||F-J-|JLJ
        JJ.F||LF7.|JFF---JL-JF---JF------JF---JLJ|||L-JFJL-J|LJL-7FJLJ|L7|F7F-J||F--JL7|F7F-JL-7|||L7L7L--JF7L7FJF7FJF7F7||L7F7F7F7LJL-JF7LJL-77||.|
        L.F7L|.|L..7|L----7F-JF7F7L-------JF7F7F7LJ|F7-L7F-7L7F--JL7F-JFJ||LJF7LJ|F--7|LJ|L7F7FJ|||FJFJF7F-JL-JL-JLJFJLJ|||7||||LJL7F7F7|L---7L7J-J7
        |.JJLL--.F||LJF-7|LJFFJLJL--------7|LJ||L--J|L7FJ||L-JL-7F7||F7|FJL--JL-7||F-J|F-JFJ|LJFJ|||FJFJLJF--7F7F7F7L7F-J|L7|||L7F7||LJ|L---7L-JJ.LJ
        F77-7-7JJ-L7J|L7L-7F7L----7F7F---7|L-7LJF7F7|FJL-JF7F7F-J|LJLJ||L7F---7FJ|||F7|L7FJ-L7FJ.LJLJJL---JF-J|LJLJL-JL-7|FJLJL-J|LJL-7|F---JF-7.F7.
        .||.F-LJ7|-FJFLL-7||L-7F-7LJLJ7F-JL--JF7|||||L7F77|LJLJF7L---7||FJL--7|L7LJLJ||FJL7F7||JF---7F7F7F-JF7|F--7F7F--JLJLF7F7-|F7F7|LJ|F7-L7L--77
        F|J.|JJ|-J-LF7|LFJ|L7FJL7|LF--7L------JLJLJ||FJ|L7L-7F7||F7F-JLJL7F--JL7L---7||L7FJ|LJL7L--7LJLJ|L--JLJL-7LJLJF7F7F7|||L7|||||L---JL--JF7FJ7
        ||7L7|.J.F-FJ|F7L7L-JL--JL7L7FJJF-----7F--7LJL-JFJF-J|||LJ|L--7F-JL7F-7|F---J||FJL7L7F7|F-7|F7F7L--7FF7F7L----JLJ||LJLJFJLJ||L7F7F--7F7|LJJ|
        LF|.L7JFFF|L7LJL-JF-7F-7F7L-J|F7L7F--7|L-7|F-7F7||L7FJ|L-7|F7FJL--7LJFJ|L---7|||F7L7LJ||L7LJ|||L7F7L-JLJL--------J|F--7L--7LJJLJLJJFJ||L--77
        -7JFJ|L7-777L----7|||||||L7F7LJ|.||F-JL--J|L7LJ|L-7|L7L7FJ||LJF--7L7FJ-L7F7FJLJ|||FJF7LJFJF7|LJ7LJL7F--7F7F7F7F7F7||F7L7F7L------7FJFJL7F-JJ
        LJ.|.F7L7JLFFF---J|FJ|FJ|FLJ|F7L-J|L-----7|FJ|FJF-J|FJFJL7||-FJF7L-JL--7LJ|L--7|||L-J|F7L-JLJF----7LJF-J|LJLJ||||||LJL7LJL-7F7F--JL-JLFJ|L|.
        J.F|7LJ7F7.F7L-7F7|L7|L7|F--J|L-7FJF---7FJLJF7L-JF7LJ.L7FJLJFJFJL7F7F--JF-JF--J||L7F-J|L----7L---7L-7L--JF---J|LJ||F--J|F-7|||L-7F---7L7L-77
        |FLJ7|-F7F-JL7F||LJFLJ7LJL7F7|.FJ|-L--7LJF7FJL---JL--77|L-7FL7L-7|||L-7JL-7L-7-LJJ||F7L7F--7L-7F7L-7L---7L----JF7LJL----JFJLJL-7LJF--JFJF-J7
        |JL-JJF|LL--7L7LJ-F--7F7F-J|LJFJFJF---JF7|LJF--------JFJF7L-7L-7||||F7L--7|F7L7.F7LJ|||LJF7L-7||L-7L7F-7L--7F7FJ|F7F----7L7F7F7|F7L-7JL-JJ-F
        F7JF|JL|JLF7L7|-F7L7FJ||L--JF-JFJ-L77F-J|L-7L-------7LL-J|F7L-7LJLJ|||F--JLJ|FJFJL--JL---JL--JLJF7|JLJJL--7LJ|L7|||L---7L-J||||LJ|F7L--7||||
        LF.FJ.LLF-JL-JL-JL-J|FJL-7F7L-7L7F7L7|F-JF7|F---7F-7L--7FJ|L7FJF7F-J|LJF--7-LJ.L-----7F7F-------J||F7F7F7FJF-JFJLJL7F-7|F7FJLJL7FJ|L7F-JJ-LF
        ||-FJJFLL------7F-7FJL--7LJ|F7L-J|L-J|L--JLJL--7|L7|F7FJL-J7||FJLJF7L--JF-JFL-F-FF---J|LJF7F-7F7FJLJ||LJLJJL--JF7F7|L7|||LJF7F-JL7|-LJJ.|-FL
        LF.|J|FLLF7F--7||FJL7F7JL7FJ||F-7L---JF7F7F----JL-JLJ|L----7LJ|F--J|F7F7L-7J7LFF-JF7F-JF7||L7LJLJF-7LJF7F77F-7FJLJ|L7||||F-J|L-7LLJJ|L--|L|7
        F7J.|FJL.||L-7|LJL-7||L7FJL7|||FJF7F7FJ|||L-7F7|F---7L7F7F7|F-J|F--J|LJL--J7F--JF-J||F-JLJL-JF--7|FJF7|||L7L7||F--J.LJLJ||F7L--J-7|JFFJF77J|
        FFJF|J.|FJL7FJ|F7F7||L7|L-7|||||FJLJLJ|LJ|F7LJ|FJF--J-LJLJ||L--J|F-7L---7LJ-L---J-FLJL-------JF7||L7|LJLJFJFJLJL--7F7F7FJLJL---7L|7FFJL7LJ7J
        F|JF777FL-7|L7||LJLJL7|L7FJLJ|||L---7|F7.LJL-7LJFJF-----7FJ|JF--J|FL7F-7|FJ7|7.F-7F-7F7F------JLJ|FJ|7F7FJFJF7F-7FJ|||||F-----7L7--JJJL777L-
        LFF----LF-JL-J|L----7|L7|L--7||||F7FJFJL----7|F-J||F----JL-JJ|F7FJF-JL7||-.LF-7L7|L7|||L7F7F--7F-JL7|FJ|L-JFJ|L7LJ-|||LJL----7L-JJJL|L7||F|J
        |||F||7|L----7L-----JL-JL---JLJL-JLJ7|F-----J|L---J|F7JJ-LF|.LJ||-L---J||LFJL7L-JL-JLJ||LJLJF-J|7F7LJL7L---J.L-J|F7|LJF7F7F--JF7|||F|FF7J7J|
        LLJ-F7F7F7F--JF-7F7F---7F-7F7F-------JL----7-L-7F7FJ|L7||LFJF.L||J.|FL7LJL7|FL--7F-7F7L7.F7FJF-JFJL7F7L--7F7-F7LFJLJF7||||L---JL-7-|.LL7F7-7
        FLL7|LJLJLJF-7L7LJLJF--J|FJ|LJF7F7F-----7F-JF-7LJLJ-|FJF|7LF7J|LJFL-JLF-FFJFFF7L||FJ|L7L-JLJFJJFJF7LJL7F7LJL-JL-JF7FJLJLJ|F-7F7F-J-7FL|LJ|FJ
        F7|FL-----7|FJFJ7F--JF--JL-JF-JLJ|L7F7F7LJF7L7L-7F-7|L--7F7F7-LJ||JF|L7FJ|-F7|L7||L-J-L7S7F7|F-JFJL--7LJL-7F7F-7FJ||F7LF7LJ7LJLJF7F|F-7J-7J7
        -LFJFLLF--J|L7|F7L--7L7F----JF7F7|.LJLJL--J|FJF-J|FJ|F--J|LJ|-FFF-JL|-||JLL|LJFJLJF---7LJLJLJ|F-JF7F7L7F-7LJLJ7LJ.LJ|L7||F------JL-7JJFJLJF-
        LLL-7LLL---JFLJ||F-7L-JL-7F-7|LJ||F--7F7F-7LJFJF7|L-JL7F7|F-JFJ-|77L--JL|.L|F7L7F7L--7L------JL7FJLJL7LJFJF----7F-7.|FJ|||F----7F7FJ|-F7FL-7
        FF7|L-7-J.LF--7|LJFJF7F77|L7||F7||L-7LJLJF|F7L-JLJF---J|||L--7-|.L|.J-|FJF-||L7||||F7L--7F7F7F-JL--7FJF7L-JF7F7LJFJFJL7|||L---7LJLJJ-7J.F|77
        J-F-7.|7-F7L-7|L-7L-JLJL-JFJ|||LJL--JLF--7||L7F-7FJLF7FJLJF--J7J.J||F7-J--JLJ-||||FJL7F-J|LJLJ7F7F-JL-JL---J||L-7L-JF7LJ||F---J-F7.FF7F-L7-J
        ||J|7.F7|||F7||F7L----7F7FJFJ|L-------JF-JLJFJL7|L-7|||F-7L---7JFL|L-FJFF.L|-FJ|||L-7|L--JF--7FJLJF--------7LJF7L---JL-7LJL--7F-J|F-JL7LL|77
        F7.LF-JL-J|||||||F7F7|LJLJ.L-JF7LF-----JF7F7L--JL--J||||-L----JL-7L-JJJJL-FJ|L7LJ|F7|L---7L-7|L7F7|-F---7F7L--JL--7F--7|F7F--J|F-J|F--J-LLLJ
        .--.L--7F7||||||||||L--7FF7F--JL7L-----7|LJL--------JLJL7F---77.LF-JF--7F||FJ-L-7LJ||F--7|.FJL7||||FJF-7LJ|F------JL7FJ|||L---JL--JL7F77|JL|
        7JL-F-7LJ||||||||||L--7L-J|L-7F7|F----7LJF---7F7F----7F7LJF--JF--7|J.LL|-|L|FF7FL7FJLJF-JL-JF7LJ|LJ|FJ-L-7|L-7F7F7F-JL7|||F7F7F7F7F7LJL-7L|.
        |-.FL7|F7|LJLJLJLJ|.F7L--7|F7LJ||L---7|F7L--7LJ|L---7LJ|F7|F77|F-JJ---|F77JLFJ|F-J|LF7L7F7F7|L7FJF-J|F---JL--J|||||F--JLJ||||LJLJ|||F7F7L777
        |7-FFJLJ|L-7F7F7F7L-JL-7||LJL7FJL----JLJL--7L7FJF-7FJF7||||||FJL-7F7-F7|L-7FJFJL-7L7|||||LJLJFLJFJF-JL------7FJLJLJL--7F7||LJLF-7||LJ||L-J.|
        --FLL7F7L--J|||LJL----7L7L--7|L7F---------7|FJL-JF|||||LJLJ|||F--J7LFJ||F-JL7L7F-JFJ|L-JL7F---7FJFJF-7-F---7LJF--7F---J||LJLF-JFJ|L77LJJ||FJ
        L-J|JLJL--7FJ||F7F7F7|L7L7F7|L7LJF-------7||L----7|L-JL7F7FJLJL-7F7FL7||L7|7L7LJF7L7L----JL--7|L-J7L7L7L--7|F7L77|L----JL---JF7L7|FJF7F7LFL7
        JJ.7-F----J|7|||LJLJL-7L7||||FJF7L------7LJL-7F7FJ|F-7FJ|LJF-7F7||L7FJ||FJF--JF-JL7L77F--7F--JL-7F-7L7L-7FJ||L7L7L-7F7F------JL-JLJ-|LJL77FL
        |.-|7L----7L7LJL-7F7F7L-JLJLJL-JL----7F7L7F-7LJ||FLJFJL7L7FJFLJLJ|FJL7||L7L---J.F7L7L7L7FJL---7FJL7|FJF7|L7||JL7L-7|||L------7F7F|F-JF-7|L|7
        |-||FF----JFJ-F--J|LJ|F----7F7F-7F--7||L7LJFJF7LJF-7|F7|FJ|.F7JF7|L7.||L7|.FF7FFJL7L7L-JL7F7F-J|F7|||FJ|L-JLJF7L--JLJ|F---7F-J|L-7|F-J-||-JL
        |.F--JF7F7FJF-JF--JF7LJF---J|||FJ|F-JLJFJF7L-JL7FJFJLJ||L7L7|L7|||FJFJL7|L-7|L7L7FJFJF--7|||L-7LJLJ|LJ|L---7||L-----7|L--7|L-7L7FJ||77.LJFFJ
        |-L--7||||L7L-7|F--JL--JF7F7|LJL7|L--7LL-JL--7FJL7|FF7LJ|L7LJFJ|||||L-7||F-J|FJFJL-JFJF-J|||F7L---7|7F7F--7L-JF----7|L7F7||F7L-JL-JL777|FL-7
        7.LL-LJLJL-JF7||L----7F7|||||F-7LJF--JF-7-F-7|L7FJ|FJL7F--JF-JFJLJ|F7FJLJL-7||FJF-7FJFJF7LJLJL-7F7|L7||L-7L--7L---7LJ|LJLJ||L7F7F--7L7.F|JJ|
        LJ7|F|-|F7F7||LJF7F--J|||||LJL7|F7L-7LL7|FJFJL7LJFJL7FJL-7FJF7L-7FJ|LJF--7FJ||L-JLLJLL7||F7F--7|||L7|||F7L--7|F7F7L7F-7F7FJL7LJ|L7FJFJFFJ|.L
        LLFL7FFFJLJLJ|F7||L---JLJLJ-F-JLJL--JF7|||FJF7L-7|F-JL7F7|L7|L7-||-L-7L-7LJL||F-77F7F7LJLJLJF-JLJL-JLJLJL---J||LJ|FJ|FJ||L-7L77L-JL-JJ7L-F7|
        F7|-F--JF7F-7LJLJ|FF7F7JF7F7|F-------JLJLJL7||F7LJL--7||||FJ|FJFJ|F7FJF-JF-7|||FJFJLJL7F--77L7F7F7F7F-7F----7|L-7|L-JL-JL-7L7L---7J7F7F7.L-F
        F|J-L-7FJ||FJF7F7L-JLJ|FJLJ|LJF7F------7F-7LJLJL-7FF7|||||L7|L7L7|||L7|F7L7LJ||L7L7F--JL-7|F7LJ|||||L7LJ-F--JL--JL----7F--JFJF7F-J.FJLJ|7LLJ
        |J7LLFJ|7LJL7|||L7F--7|L--7|F7||L----7FJL7L7F----JFJLJLJ||FJ|FJ7||||FJLJL7|F7LJFJF||F7|F7||||F-J|LJ|FJF--JF----------7|L7F7L-J|L---JF7FJ-7JL
        J77-|L-JF7F7LJ||LLJF-JL---JLJLJL7F---JL7FJ7LJ|F--7L--7F7LJL7|L7FJ|||L7F--JLJ|F-JF7||||FJLJLJ|L-7L-7LJFJF-7|F------7F-JL7LJL-7.|F7F7FJLJ-LJ7.
        |-|.77.||LJL--JL7LFJF7F-7F-----7LJF7F-7|L----7|F-JF--J|L--7||FJL7|||FJL-7F--J|F7|||LJ|L7F7F7L-7L--JF-JFJLLJL-7|F-7||F-7L7F-7L7LJ|||L7J.-7L77
        |JL|JFF-L---7F-7|FJFJLJ7LJF7F-7L-7|LJFJ|F7F--J|L7|L---JF7FJ|||F7|||||F--JL-7FJ||||L-7|7LJLJ|F7L---7L7FJF-----JFJFJLJ|FJFLJFJFJJ.LJ|FJJF-J7|F
        ||J|L-J.F---J|FJ|L7L7F----JLJFJ-FJ|F-J-LJLJF77L7|F7-F7.|||FJ||||||||||F-7F-JL7||||F7||F7F7FJ||F---J7LJ|L----7||FJ.F7|L---7|FJ|.F7-LJJ|LF-7J.
        LJ.|7J.FL---7|L7|FJFJL------7L--JFJ|F7|F7LFJ|F7||||FJ|FJLJL-J||||LJ||||FJL7F-J|||||||LJ|||L-J|L7F7FF7-F7JF--JFJL--JLJF7F7|||F7FJ|-F|-7J|J|.7
        .F7L7J-LJ.|.LJFJ|L7L7FF7F---JF-7FJJLJL-JL7L7||||||||FJL----7FJ||L-7LJ||L7FJL-7|LJLJ|L-7LJ|F-7L7LJL7||FJL7L---JF7F-7F-JLJLJ|LJLJFJL|J7J||FL7J
        FJ|-L7-.FL7LJ|L7|LL-JFJLJF7F7L7LJF7F-7F--JFJ||LJ||||L7F-7F-JL7|L-7|F-J|FJ|F--JL--7FJF-JF-JL7L7|F--J||L7FJF7F7FJ|L7|L----7FJF--7L7-F7-77L--L7
        .FL7L7-JJL-7.FFLJF7F-JF-7|LJL7|F-JLJ-LJF-7L7|L-7|||L7|L7|L--7|L-7LJL7FJL7|L7FF7F-JL7L7FJ-F7|FJ|L7F7||FJL-J|||L7|FJL--7F-JL7L-7L-JFJ|.FLJ7.L|
        FFJ7|LFL-J.L7-F--J|L-7|LLJF--J|L------7|FJ7||F7||||FJ|FJ|F-7|L7|L--7||F-JL7|FJ|L--7|FJ|F7|||L7|FJ|LJ|L---7LJL-J|L---7LJF-7L--JF-7L7|-||L|7LJ
        FFJ-|7|J7J.L|-L--7|F7||F--JF7FJFF7LF--J|L7FJ||||||||FJL7|L7LJFJF7F-JLJL-7FJLJFJ7F-J|L7|||||L7|||7L7FJF7F7L-7F-7L----JF7|FJF7F7|FJ-||F77F|LJ.
        LJ|7.7|LL-7J|-F--JLJLJ|L-7FJ||F-JL-JF-7|FJL7|||||||||F-JL7|F7L-J|L-7F---JL-7FJF7L-7L7|LJ|||FJ||L7FJ|FJLJ|F-J|FJF-----J||L-JLJLJL7|||F7F7J.|7
        |-L77||..7LLF-L7F7F7F7|F-J|JLJL7F--7L7|||JL||||||||||L7F-JLJ|F--JF7||JF7-F7||J||F7L7|L-7|||L7||FJL7|L-7FJL--JL-JF7F7F7LJF7F7F7F7L-JLJLJ|.--7
        JJJJF|7F.|F7JFFJ|LJ||LJ|F-JF---J|F7|FJ||L7FJLJ|||||||FJL7F7FJL-7FJLJ|FJ|FJ||L7||||FJL7FJ||L7|||L7FJ|F7||F7F-7F--JLJLJ|F-JLJLJLJL7F7F7F-J7|..
        F||LL-L.|-L7FLL7||FJ|F-J|F-JF---J|LJ|FJL7||F7LLJ|||||L7FJ||L7F-J|FF-J|FJL7||L||||||F7LJFJ|-|||L7||FJ||||||L7|L---7F-7|L7F7.F7F-7LJLJLJF|F7-J
        -J-F-|F|JLL|L77LJFJFJL--JL--JF---JF7|L7FJ|LJ|F--J|LJ|FJL7|L7|L-7L7L-7|L7FJLJFJ||||LJL-7L7L7LJL7||||FJ||||L7||F7F7LJFJL7LJL-J||FJ|J7|L|-7|JFJ
        L7LLLJFL7-L77-JJ.L-JF7FF--7F7L---7|||-LJ|L-7|L7F7L-7||F7|L7||F-JFJF-J|FJL--7L7||||F7F7L7L7L7|LLJ||LJ|||||FJ|LJLJ|F7L-7|F7F-7LJL7F7J7.|LJJFJJ
        7J.F7L7-|7.J7J.LFF--JL-JF7LJL----J||L7FF---J|FJ|L-7||||LJFJLJL-7L7L7FJ|F-7FJJLJ||||||L7L7L7L7F7FJL--7||LJL7L--7JLJ|F7|LJ|L7|F-7LJ|JL|.|.LF.J
        J7FFJ|.FJ77.||.LFL-7F-7FJL7F-7F7F7|L7L7|F-7FJL7L7-LJ||L-7|F----JFJFJL7|L7|L7FF7||LJ||-L-JJL7LJ||F-7FJ||F--JF-7|F-7||||F7L-JLJ7L7FJ-FF-7.FL|7
        .J7|7J-7-LJ|J-|7F7FJ|FJ|F-J|JLJLJ|L7L7||L7|L7-L7L-7FJ|F-J||F-7F7L7L7FJL-J|FJFJLJL7FJL--7|F-JF7||L7||.LJL7F7L7|LJFJLJLJ||F---7F7LJ-77||L77.J7
        |FJ.L.-JJ.L7J.|FJLJFJL-J|F7L7F---JFJFJ|L-JL7L-7L7FJ|FJL-7|LJFJ|L7L7|L---7||-L7F-7|L-7F7|FJF7|||L7||L-7F-J|L7||F7L7F7F-JLJF-7LJL7J-F7JF7L-.LF
        F7J-J-F|---J7FF|F7FJFF7FJ|L7|L7F-7|LL7L--7FJF7L7||F||F--JL7F|FJFJFJ|F---JLJF-JL7LJF7||LJL7|||||FJ||F7|L7FJ|||||L7||LJF--7L7|F7FJJ-||JLJ.L-FF
        L|JJLFLJLFJF-LFJ|||JFJLJFJFJ|||L7LJF-JF7FJ|FJ|FJ|L7LJL-7F7L7|L7L7L7|L--7-F7L7F7L7L||||LF-J|||LJL7|LJ|L7||F-J||L7|LJF7L-7|FJLJLJJ.F|.FL.J.LFL
        .F-7F777|.77JLL7|||FJF7FJLL7|FJFJF-JF7|||FJ|FJ||L7L7F--J|L7||FJJL7|L7F7|FJL-J|L7L-J|||FJF7||L7|FJL77|FJLJ|F7||FJL--JL-7|LJ.F7|FL7F|FL-FJ.F|J
        F|-F-LL|-|-J||L||||L7|LJFF-J|L7L7|F7|||||L7||FJF-JFJL-7FJFJ||L-7FJL7LJ|||F-7FJ||F-7|LJL7|LJL7L7|F7L7||7F-J||||L------7|L--7|L77.JFFF-L.7F|7J
        LL-.F7|JL77-7J.LJLJL||LF7L--J-L7|||||||LJFJ|LJFJF7|F--JL7|FJ|F7||F7L7L|||L7||F-JL7LJF--JL7F|L7|LJL-J|L7L-7|LJ|F------JL7F7LJFJ77.LF|--7JFJ|7
        F|FFJ-JF--J-JFL7JJJ.||FJL-7F---J|LJLJ||F7L7L-7L7|||L7F7FJ|L7||||LJ|FJFJ||FJLJL7F7L-7L7F-7L7F7|L----7L7L7FJL-7|L---7F--7||L--J7J-||.L-F7-J7.L
        F|7|L|-L|7|JF-FJ7L7FLJL--7LJF7F7|F---JLJL7L-7L7|||L7||||FJFJ|||L-7|L7|FJ||FF--J|L--JFJL7|FJ|LJF-7F-J-L-JL7F7|L7F-7LJF7||L---7-7LLF7L7.|--LL7
        |J|7.-7J|77--7|L7.LFJJ|F-JF7|LJLJ|F7F-7F-JF7|FJLJ|FJ||LJL7||||L7FJ|FJLJF||FJF-7L--77L7FJ||FJF7|FJL--7|F--J|LJ-||-L7FJLJL7F--J-L-7LJ.|7F7|.J7
        |FF-7F-7LJ|JF|JF|--JJ--L7FJ||F---J|LJ-|L-7|LJ|F--J|7|L77FJL7LJ-||FJL--7FJ|L7|FJF-7L7FJL7LJ|FJLJ|F7F7L7L7F7L--7||F7|L-7.L|L77||JFLL.FJ7L-7J7L
        |7F7FJJJJF7-7JF7--J|.F-FJ|FJ|L---7|F7FJF7||F7|L--7L7|FJFJF7|F--J|L-7F-J|FJL||L7|FJFJL7FJF-JL-7J|||||FJ-|||F--J|||LJF7L7.|FJ7-F-JF-F|J7F|L|7.
        LLJFFJ.|.J7L--LJ.FFF-JFL7|L7|LF--J||LJFJ||LJ|L7F7|FJ|L7L7|LJL7F7|F7LJF-JL-7||FJ|L7|JLLJ.L-7F7|FJ|LJ|L7FJ||L--7|||F7|L-JFJL77.7J-L-FL7JF--FF7
        ||.-J.|77F7L|.JL-77..7.|LJFJ|FJF-7||F7||LJ-FJFJ|LJL7|FJ.|L7F7LJ|LJL7FJF7F-J|||FJFJL7LLF--7LJ||L7L-7|FJL-J|F7FJ|||||L--7L7FJ7-|J.LF-FJ.|7LJJ-
        -F-.FF|JL-J--77LLJ7|F|-FJ-L7||FJ-LJ|||L---7L-JFJF7FJ|L7FJFJ|L--JF7FJ|FJ|L-7||||FJF7L7FJF7L-7||L|F7||L-7F-J|||7LJLJ|F--J.LJJ77J..L7JF7FFJF7JJ
        LLLL7FJF7F7J|.J.L|-JFJ7L7LFJ|||-LF-J||F7F7L-7-L7||L7|FJL7L7|F-7FJ||FJ|FJF7|||LJL-JL7LJFJL7FJLJFJ|||L7FJ|F7||L---7FJL-7-JJL-LJFF.F7.|-JJ-L7.|
        FJLL7JFJL--FJ|L7.LFFJFJ.L-L7|LJJ.L7FJ|||||F-JF-J||FJ|L-7|FJ||7|L7||L-JL7|LJLJF-----JF-JF-JL--7L7|||7LJ|||LJ|F7F-JL7F7||.-.FJJ-JFL|-J-L-.J.L7
        L-7J|LJ-FJL|-7.LFJF--7.FJJL|L7FFJLLJFJ|LJ|L-7L7FJ||7|F7||||LJFJFJLJF---JL7F--JF----7L-7|F-7F7|FJ||L7F7-|L77||LJ||FLJLJ77LFJ7LF7|.L.L|F|7JF||
        F-|7L--F-77J|.|FF7|-F.F|J|LL-J-|L-LLL7|F7|F7L7LJFJL7||LJ|L7JJL7L7JFL-7F7FJL7F7|F---JF-JLJ.||LJL7|L7LJL7|FJFJL7JFL|JJ|-LFF7LF77F7FLFF.JLF7F--
        F7LFJJFF-77FFLFF|-|F|-J..|.J-|FL7J..FJLJ|||L7L-7|F7||L-7L7|..LL-JJ-LFJ||L7F||LJL--7FJF-7F-JL--7||-L7F-J|||L7FJLJF|F7||L|JF----7LJ-JLF7-L|L7|
        L|||-LLJFLFJLLLJJFL|L-|7.L|JLLFJ|..-L7F-JLJ|L--J||||L7FJJLJF7JLL|J-|L7|L7|FJL7-F--JL-JFJL7F-7FJLJF7|L-7||F-J|L7.FL|-L--JF|FLF7LJL.FFLJFFJ-LL
        L|F..L|FL|J.F|.||FF--JFJFJLFJLJFL--7L|L7JLL-7LF-J|||FJL7FJLFJ7J.|77|-||LLJL7FJ.|F7F7F7|F7||FJL7FFJLJF7||||F-J7L7-JJ.J|7|-FF7L7F-JLLLJJFL77F|
        FJ|L77J7.F--L7|.7-FJL7|FL|7L-7FL-F7LJL-JJ7..|7L--JLJL7FJJ.LLLF77LFLJ-LJJJJ.||F-J|||||LJ||||L--J-L--7|LJLJLJJJFFJ|J.FL-|JFLLJJ|-L7F||||FLLFJJ
        7-L7L|FJ-J.||7J.--J7-J-L-FJ7JFJ|F|JJLJ|-FJ-F|LJJ.|.|LLJJ.-.|JLJ7-LJF|FL-LLFLJL-7|LJ|L--J|||F|J|F|||LJJ7|.||.L7J7|7.FJL|L-7|.FL.L7JJ7|-|||JJ|
        L7LJ7.JJFL-F|J----JF.LFJJ|F--|7L7J|--7F7J|.LJJ.|.F-J|.JJJ.F7FLF77J|LL-J..|LFF--JL7FJF7F-J|L-77|F7JFJL|-F--JFFJFF.FLLJ.J77|7F|L--|JLL|7LF7.LJ
        JL7L--77|JLF-JF|FJ|.J-|-FLLJF7J..7|L|FL7.|-JJLLF77F7L|JLJF.|-|FLF.|L|JF|-J.LL-7F7|L7||L7LL7FJ-7FJF77J|FFFJ.|LL-7-JL||7.--7-FL7|-7|.LFL7|J7..
        LF|77FJJ7F-JJ7LJ7||7.|LFJL|L|JL7-.|-J|-LJ.||7J||L--LFJ-L.|--JLJ||L7-L7-JFJ-LLFJ|LJ.LJL-J-JLJJL.L-J||J|..|J-F7||LLFF---JL|J||-FJ7|-J.|LFL7L77
        F-J--7-|LJJJF7L7-F7|-F-L7FF-|F7.LFF-FLF.L-FL7L7|-J.FL|7.F7.|FJJL77JF.7FF.|-LLL7|-|.LJJ.FLJL|7.FJF|L7F-JJ-7.LL-7F77|LL-|FL77|-JL|J7JL-F7|F7J|
        LJJ.F|LLJ|J.F7J.FJ|LL|JL7-LJFJL|-FJ--JLL-L7JL7JJJLLJJJF7-FL-7JJ.LJLJ-|-7JJ-LLLLJ-J-LJL-L.L.F-|JLF7.J-L.L|LL-J-LFJ.F7LFJ7JL7..L7LL-.L|LF--|-J
        """
        return input
    }
    
        
    
    func stepsOfHalfWay(input: String) -> Int {
        
        var steps: Int = 0
        
        // MARK: - Translate an input
        
        // separate on rows
        let lines: [String] = input.components(separatedBy: "\n")
        
        // separate on grid
        var grid: [[Character]] = []
        
        for line in lines {
            let row = Array(line)
            grid.append(row)
        }
        
        // MARK: - Find "S"
        
        var sCoordinates: [Int] = []
        
        // Find "S"
        for (rowIndex, row) in grid.enumerated() {
            for (columnIndex, char) in row.enumerated() {
                if char == "S" {
                    var nextCoordinates: [Int] = []
                    var previousCoordinates: [Int] = []
                    var currentChar: Character = "S"
                    sCoordinates = [rowIndex, columnIndex]
                    
                    let sDirections: [[Int]] =
                    [
                        [rowIndex + 1, columnIndex],     // down
                        [rowIndex,     columnIndex - 1], // left
                        [rowIndex - 1, columnIndex],     // up
                        [rowIndex,     columnIndex + 1]  // right
                    ]
                    
                    // `|` is a vertical pipe connecting north and south.
                    let vPipe: Character = "|"
                    
                    // `-` is a horizontal pipe connecting east and west.
                    let hPipe: Character = "-"
                    
                    // L is a 90-degree bend connecting north and east.
                    let bigLPipe: Character = "L"
                    
                    // J is a 90-degree bend connecting north and west.
                    let bigJPipe: Character = "J"
                    
                    // 7 is a 90-degree bend connecting south and west.
                    let big7Pipe: Character = "7"
                    
                    // F is a 90-degree bend connecting south and east.
                    let bigFPipe: Character = "F"


                    // Find the first possible Pipe for S:
                    for sDirection in sDirections {
                        let currentRow = sDirection[0]
                        let currentColumn = sDirection[1]
                        let currentChar = grid[currentRow][currentColumn]

                        // down from S and symbol is |, L or J
                        if sDirection == [rowIndex + 1, columnIndex] && (currentChar == vPipe || currentChar == bigLPipe || currentChar == bigJPipe) {
                            nextCoordinates = sDirection
                            break
                        }
                        
                        // left from S and symbol is -, L or F
                        if sDirection == [rowIndex, columnIndex - 1] && (currentChar == bigFPipe || currentChar == hPipe || currentChar == bigLPipe) {
                            nextCoordinates = sDirection
                            break
                        }
                        
                        // up from S and symbol is |, F or 7
                        if sDirection == [rowIndex - 1, columnIndex] && (currentChar == vPipe || currentChar == bigFPipe || currentChar == big7Pipe) {
                            nextCoordinates = sDirection
                            break
                        }
                        
                        // right from S and symbol is -, J or 7
                        if sDirection == [rowIndex, columnIndex + 1] && (currentChar == bigJPipe || currentChar == hPipe || currentChar == big7Pipe) {
                            nextCoordinates = sDirection
                            break
                        }
                    }
                    
                    // First step from "S"
                    var currentCoordinates = nextCoordinates
                    currentChar = grid[currentCoordinates[0]][currentCoordinates[1]]
                    previousCoordinates = sCoordinates
                    
                    // MARK: - Going through Maze
                    
                    while currentChar != "S" {
                        currentCoordinates = nextCoordinates
                        currentChar = grid[currentCoordinates[0]][currentCoordinates[1]]
                        nextCoordinates = findNextDirection(for: currentChar, currentCoordinates: currentCoordinates, previousCoordinates: previousCoordinates)
                        
                        previousCoordinates = currentCoordinates
                        steps += 1
                    }
                    break
                    
                }
            }
        }
    
        var halfWay = steps / 2
        return halfWay
    }
    
    func findNextDirection(for char: Character, currentCoordinates: [Int], previousCoordinates: [Int]) -> [Int] {
        var currentRow = currentCoordinates[0]
        var currentColumn = currentCoordinates[1]

        var nextCoordinates: [Int] = []
        // `|` ⬆️
        if char == "|" && previousCoordinates == [currentRow + 1, currentColumn] {
            nextCoordinates = [currentRow - 1, currentColumn]
            return nextCoordinates
        }
        // `|` ⬇️
        if char == "|" && previousCoordinates == [currentRow - 1, currentColumn] {
            nextCoordinates = [currentRow + 1, currentColumn]
            return nextCoordinates
        }
        // `-` ➡️
        if char == "-" && previousCoordinates == [currentRow, currentColumn - 1] {
            nextCoordinates = [currentRow, currentColumn + 1]
            return nextCoordinates
        }
        // `-` ⬅️
        if char == "-" && previousCoordinates == [currentRow, currentColumn + 1] {
            nextCoordinates = [currentRow, currentColumn - 1]
            return nextCoordinates
        }
        // `F` ↗️
        if char == "F" && previousCoordinates == [currentRow + 1, currentColumn] {
            nextCoordinates = [currentRow, currentColumn + 1]
            return nextCoordinates
        }
        // `F` ↙️
        if char == "F" && previousCoordinates == [currentRow, currentColumn + 1] {
            nextCoordinates = [currentRow + 1, currentColumn]
            return nextCoordinates
        }
        // `7` ↘️
        if char == "7" && previousCoordinates == [currentRow, currentColumn - 1] {
            nextCoordinates = [currentRow + 1, currentColumn]
            return nextCoordinates
        }
        // `7` ↖️
        if char == "7" && previousCoordinates == [currentRow + 1, currentColumn] {
            nextCoordinates = [currentRow, currentColumn - 1]
            return nextCoordinates
        }
        // `J` ↗️
        if char == "J" && previousCoordinates == [currentRow, currentColumn - 1] {
            nextCoordinates = [currentRow - 1, currentColumn]
            return nextCoordinates
        }
        // `J` ↙️
        if char == "J" && previousCoordinates == [currentRow - 1, currentColumn] {
            nextCoordinates = [currentRow, currentColumn - 1]
            return nextCoordinates
        }
        // `L` ↘️
        if char == "L" && previousCoordinates == [currentRow - 1, currentColumn] {
            nextCoordinates = [currentRow, currentColumn + 1]
            return nextCoordinates
        }
        // `L` ↖️
        if char == "L" && previousCoordinates == [currentRow, currentColumn + 1] {
            nextCoordinates = [currentRow - 1, currentColumn]
            return nextCoordinates
        }
        
        return nextCoordinates
    }
    
}

//PipeMaze().stepsOfHalfWay(input: PipeMaze().shortInput)  // Right Answer: 4
//PipeMaze().stepsOfHalfWay(input: PipeMaze().shortInput2) // Right Answer: 8
PipeMaze().stepsOfHalfWay(input: PipeMaze().longInput)   // Right Answer: 6864

