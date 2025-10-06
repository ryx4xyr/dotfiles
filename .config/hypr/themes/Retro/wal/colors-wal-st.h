const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0d1011", /* black   */
  [1] = "#606063", /* red     */
  [2] = "#994037", /* green   */
  [3] = "#A27671", /* yellow  */
  [4] = "#9C8B6F", /* blue    */
  [5] = "#42759A", /* magenta */
  [6] = "#4896C3", /* cyan    */
  [7] = "#c5c0c1", /* white   */

  /* 8 bright colors */
  [8]  = "#898687",  /* black   */
  [9]  = "#606063",  /* red     */
  [10] = "#994037", /* green   */
  [11] = "#A27671", /* yellow  */
  [12] = "#9C8B6F", /* blue    */
  [13] = "#42759A", /* magenta */
  [14] = "#4896C3", /* cyan    */
  [15] = "#c5c0c1", /* white   */

  /* special colors */
  [256] = "#0d1011", /* background */
  [257] = "#c5c0c1", /* foreground */
  [258] = "#c5c0c1",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
