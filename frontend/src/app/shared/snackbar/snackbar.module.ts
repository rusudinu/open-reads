import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MatButtonModule } from '@angular/material/button';
import { MatSnackBarModule } from '@angular/material/snack-bar';

import { SnackbarComponent } from './snackbar.component';
import { SnackbarService } from './snackbar.service';
import { MatIconModule } from "@angular/material/icon";

@NgModule({
	declarations: [
		SnackbarComponent
	],
	imports: [
		CommonModule,
		MatButtonModule,
		MatIconModule,
		MatSnackBarModule
	],
	exports: [
		MatSnackBarModule
	],
	providers: [
		SnackbarService
	]
})
export class SnackbarModule {
}
