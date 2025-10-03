const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000D19", /* black   */
  [1] = "#233A48", /* red     */
  [2] = "#4E3C48", /* green   */
  [3] = "#6F3D48", /* yellow  */
  [4] = "#60444B", /* blue    */
  [5] = "#8A3E48", /* magenta */
  [6] = "#91444A", /* cyan    */
  [7] = "#cf9a9b", /* white   */

  /* 8 bright colors */
  [8]  = "#906b6c",  /* black   */
  [9]  = "#233A48",  /* red     */
  [10] = "#4E3C48", /* green   */
  [11] = "#6F3D48", /* yellow  */
  [12] = "#60444B", /* blue    */
  [13] = "#8A3E48", /* magenta */
  [14] = "#91444A", /* cyan    */
  [15] = "#cf9a9b", /* white   */

  /* special colors */
  [256] = "#000D19", /* background */
  [257] = "#cf9a9b", /* foreground */
  [258] = "#cf9a9b",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
