## Fontbakery report

<details>
<summary><b>[2] Kreon-VF.ttf</b></summary>
<details>
<summary>:fire: <b>FAIL:</b> Checking with Microsoft Font Validator.</summary>

* [com.google.fonts/check/037](https://github.com/googlefonts/fontbakery/search?q=com.google.fonts/check/037)
* :fire: **FAIL** MS-FonVal: The version number is neither 0x00010000 nor 0x0001002 DETAILS: 0x00010003
* :fire: **FAIL** MS-FonVal: The value doesn't match the calculated value DETAILS: maxComponentElements = 5, calculated = 3
* :warning: **WARN** MS-FonVal: The version number is valid, but less than 5 DETAILS: 4
* :warning: **WARN** MS-FonVal: PANOSE(tm) is undefined. Font mapping may not work properly
* :warning: **WARN** MS-FonVal: There are undefined bits set in fsSelection field DETAILS: Bit(s) 7
* :warning: **WARN** MS-FonVal: The value of sTypoAscender minus sTypoDescender is greater than unitsPerEm DETAILS: sTypoAscender = 974, sTypoDescender = -286
* :warning: **WARN** MS-FonVal: A CodePage bit is set in ulCodePageRange, but the font is missing some of the printable characters from that codepage DETAILS: 
	- bit #0, Latin 1 (13 missing, first ten missing chars are: U0192 U2026 U2020 U2021 U02C6 U2030 U0160 U017D U02DC U2122)
	- bit #1, Latin 2 (62 missing, first ten missing chars are: U2026 U2020 U2021 U2030 U0160 U015A U0164 U017D U0179 U2122)
	- bit #4, Turkish (17 missing, first ten missing chars are: U0192 U2026 U2020 U2021 U02C6 U2030 U0160 U02DC U2122 U0161)
	- bit #7, Baltic (56 missing, first ten missing chars are: U2026 U2020 U2021 U2030 U02C7 U2122 U02DB U0156 U0157 U0104)
* :warning: **WARN** MS-FonVal: The table does not contain any Apple subtables
* :warning: **WARN** MS-FonVal: Apple logo mapping test not performed, cmap 1,0 not present
* :warning: **WARN** MS-FonVal: Misoriented contour DETAILS: Glyph index 220
* :warning: **WARN** MS-FonVal: The unitsPerEm value is not a power of two DETAILS: 1000
* :warning: **WARN** MS-FonVal: The lowestRecPPEM value may be unreasonably small DETAILS: lowestRecPPEM = 6
* :warning: **WARN** MS-FonVal: Ascender is different than OS/2.usWinAscent. Different line heights on Windows and Apple DETAILS: hhea.Ascender = 974, OS/2.usWinAscent = 1137
* :warning: **WARN** MS-FonVal: Descender is different than OS/2.usWinDescent. Different line heights on Windows and Apple DETAILS: hhea.Descender = -286, OS/2.usWinDescent = 326
* :warning: **WARN** MS-FonVal: The LineGap value is less than the recommended value DETAILS: LineGap = 0, recommended = 203
* :warning: **WARN** MS-FonVal: The leftSideBearing is greater than the advance width (unlikely value) DETAILS: glyph# 221
* :warning: **WARN** MS-FonVal: Loca references a glyf entry which length is not a multiple of 4 DETAILS: Number of glyphs with the warning = 109
* :warning: **WARN** MS-FonVal: maxSizeOfInstructions computation not via either approved method DETAILS: glyf maxSizeOfInstructions=197, prep size=189, fpgm size=3605, whereas maxp maxSizeOfInstruction is 3605

</details>
<details>
<summary>:warning: <b>WARN:</b> Check if each glyph has the recommended amount of contours.</summary>

* [com.google.fonts/check/153](https://github.com/googlefonts/fontbakery/search?q=com.google.fonts/check/153)
* :warning: **WARN** This check inspects the glyph outlines and detects the total number of contours in each of them. The expected values are infered from the typical ammounts of contours observed in a large collection of reference font families. The divergences listed below may simply indicate a significantly different design on some of your glyphs. On the other hand, some of these may flag actual bugs in the font such as glyphs mapped to an incorrect codepoint. Please consider reviewing the design and codepoint assignment of these to make sure they are correct.

The following glyphs do not have the recommended number of contours:

Glyph name: asterisk	Contours detected: 2	Expected: 1 or 4
Glyph name: Q	Contours detected: 3	Expected: 2
Glyph name: Eth	Contours detected: 3	Expected: 2

</details>
<br>
</details>

### Summary

| :broken_heart: ERROR | :fire: FAIL | :warning: WARN | :zzz: SKIP | :information_source: INFO | :bread: PASS |
|:-----:|:----:|:----:|:----:|:----:|:----:|
| 0 | 1 | 1 | 63 | 6 | 64 |
| 0% | 1% | 1% | 47% | 4% | 47% |

**Note:** The following loglevels were omitted in this report:
* **SKIP**
* **INFO**
* **PASS**
