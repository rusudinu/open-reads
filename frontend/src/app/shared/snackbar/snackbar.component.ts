import { Component, Inject } from '@angular/core';
import { MatSnackBarRef, MAT_SNACK_BAR_DATA } from '@angular/material/snack-bar';

@Component({
	selector: 'csh-snackbar',
	templateUrl: './snackbar.component.html',
})
export class SnackbarComponent {
	rightIcon: string | undefined;

	constructor(
		@Inject(MAT_SNACK_BAR_DATA) public data: any,
		public snackbarRef: MatSnackBarRef<SnackbarComponent>
	) {
		switch (data.type) {
			case 'success':
				this.rightIcon = 'task_alt';
				break;
			case 'warning':
				this.rightIcon = 'warning_amber';
				break;
			case 'error':
				this.rightIcon = 'highlight_off';
				break;
			case 'info':
				this.rightIcon = 'new_releases';
				break;
		}
	}
}
