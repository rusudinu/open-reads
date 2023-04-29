import { Injectable } from '@angular/core';
import { MatSnackBar } from '@angular/material/snack-bar';
import { SnackbarComponent } from "./snackbar.component";

enum SnackbarTypeEnum {
  INFO = 'info',
  SUCCESS = 'success',
  ERROR = 'error',
  WARNING = 'warning'
}

const DEFAULT_DURATION = 6000;

@Injectable()
export class SnackbarService {
  private queue: Array<{ message: string, type: SnackbarTypeEnum, duration: number }> = [];

  constructor(private _snackBar: MatSnackBar) {
  }

  /** Used to display default info snackbar with 'black' background.
   * @param  {string} message String message to be displayed in snackbar.
   * @param  {number} duration (Optional) Time in mililseconds before snackbar will disapepar.
   * @duration Default value is 6 seconds. Negative value will make it stay on screen until close button is pressed.
   */
  info(message: string, duration = DEFAULT_DURATION) {
    this.open(message, SnackbarTypeEnum.INFO, duration);
  }

  /** Used to display success snackbar with 'success' background color.
   * @param  {string} message String message to be displayed in snackbar.
   * @param  {number} duration (Optional) Time in mililseconds before snackbar will disapepar.
   * @duration Default value is 6 seconds. Negative value will make it stay on screen until close button is pressed.
   */
  success(message: string, duration = DEFAULT_DURATION) {
    this.open(message, SnackbarTypeEnum.SUCCESS, duration);
  }

  /** Used to display error snackbar with 'error' background color.
   * @param  {string} message String message to be displayed in snackbar.
   * @param  {number} duration (Optional) Time in milliseconds before snackbar will disappear.
   * @duration Default value is 6 seconds. Negative value will make it stay on screen until close button is pressed.
   */
  error(message: string, duration = DEFAULT_DURATION) {
    this.open(message, SnackbarTypeEnum.ERROR, duration);
  }

  /** Used to display warning snackbar with 'warning' background.
   * @param  {string} message String message to be displayed in snackbar.
   * @param  {number} duration (Optional) Time in mliliseconds before snackbar will dispapear.
   * @duration Default value is 6 seconds. Negative value will make it stay on screen until close button is pressed.
   */
  warning(message: string, duration = DEFAULT_DURATION) {
    this.open(message, SnackbarTypeEnum.WARNING, duration);
  }


  private open(message: string, type: SnackbarTypeEnum, duration: number) {
    this.queue.push({message, type, duration});
    if (this.queue.length === 1) {
      this.showNext();
    }
  }

  private showNext() {
    if (this.queue.length > 0) {
      const {message, type, duration} = this.queue[0];
      this._snackBar.openFromComponent(SnackbarComponent, {
        data: {
          type,
          message
        },
        panelClass: [ 'csh-snackbar', type ],
        horizontalPosition: 'right',
        duration
      }).afterDismissed().subscribe(() => {
        this.queue.shift();
        this.showNext();
      });
    }
  }

}
