set(STAGE2_HEADERS
    AdBuffer.hh
    CalcsTree.hh
    Calculator.hh
    GapFinder.hh
    IbdTree.hh
    Li9Calc.hh
    MultCut.hh
    MuonAlg.hh
    Readers.hh
    ReCalc.hh
    Selectors.hh
    stage2_globals.hh
    stage2_main.hh
    stage2_ihep.hh
    stage2_dubna.hh
    FukushimaLambertW.hh
)

add_library(stage2 SHARED
    AdBuffer.cc
    CalcsTree.cc
    Calculator.cc
    IbdTree.cc
    Li9Calc.cc
    MultCut.cc
    MuonAlg.cc
    Readers.cc
    ReCalc.cc
    Selectors.cc
    stage2_main.cc
    stage2_ihep.cc
    stage2_dubna.cc
    external/FukushimaLambertW.cc
)

add_executable(stage2.exe 
    stage2_exe.cpp
)

target_include_directories(stage2 PUBLIC "${CMAKE_CURRENT_LIST_DIR}")
target_include_directories(stage2 PUBLIC "${CMAKE_CURRENT_LIST_DIR}/external")
ROOT_GENERATE_DICTIONARY(Dict_stage2 "${STAGE2_HEADERS}" MODULE stage2 OPTIONS -interpreteronly)
target_link_libraries(stage2 PUBLIC common)
target_link_libraries(stage2.exe PUBLIC stage2)
target_compile_definitions(stage2 PRIVATE IBDSEL_BASE="${IBDSEL_BASE}")
install_headers(stage2)
