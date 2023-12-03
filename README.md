# Runtime Detection of Data Races in OCaml with ThreadSanitizer

Presentation given at OCaml Workshop 2023 from ICFP 2023, on Saturday 9 Sep 2023.

## Abstract

The possibility to write truly parallel OCaml code brings forth new possibilities of bugs. Among those, data races (concurrent accesses to the same data) are hard to detect and dangerous, as they are non-deterministic, possibly silent, and can lead to highly unexpected results. ThreadSanitizer (TSan) is an open-source library and program instrumentation pass to reliably detect data races at runtime. TSan has been instrumental in finding thousands of data races across many programming languages. We will describe the core principles of data race detection in TSan, explain why it was challenging to apply it to OCaml, and the adaptations needed to the runtime system. We plan to demo how you can already use it in your own code, and explain the limitations to be aware of.

## Authors

- Olivier Nicole: [@OlivierNicole](https://github.com/OlivierNicole) and [www](https://otini.chnik.fr/)
- Fabrice Buoro: [@fabbing](https://github.com/fabbing)

## Extended abstract

The rendered [extended abstract](extended_abstract/final_version.pdf) and [typst sources](extended_abstract/).

## Slides

The rendered [slides](presentation/presentation.pdf) and [LaTeX sources](presentation/).

## Talk

The recording of the presentation is available at [https://www.youtube.com/watch?v=zr9S0Fr_Chc](https://www.youtube.com/watch?v=zr9S0Fr_Chc).

## Other links

- Talk page: [Runtime Detection of Data Races in OCaml with ThreadSanitizer](https://icfp23.sigplan.org/details/ocaml-2023-papers/12/Runtime-Detection-of-Data-Races-in-OCaml-with-ThreadSanitizer)
