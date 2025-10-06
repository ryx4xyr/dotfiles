const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0b101b", /* black   */
  [1] = "#2C4FA1", /* red     */
  [2] = "#2C6DBD", /* green   */
  [3] = "#5675B1", /* yellow  */
  [4] = "#2C76C1", /* blue    */
  [5] = "#417DC0", /* magenta */
  [6] = "#A17397", /* cyan    */
  [7] = "#aab8d2", /* white   */

  /* 8 bright colors */
  [8]  = "#768093",  /* black   */
  [9]  = "#2C4FA1",  /* red     */
  [10] = "#2C6DBD", /* green   */
  [11] = "#5675B1", /* yellow  */
  [12] = "#2C76C1", /* blue    */
  [13] = "#417DC0", /* magenta */
  [14] = "#A17397", /* cyan    */
  [15] = "#aab8d2", /* white   */

  /* special colors */
  [256] = "#0b101b", /* background */
  [257] = "#aab8d2", /* foreground */
  [258] = "#aab8d2",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
