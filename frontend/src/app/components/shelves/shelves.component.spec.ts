import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ShelvesComponent } from './shelves.component';

describe('ShelvesComponent', () => {
  let component: ShelvesComponent;
  let fixture: ComponentFixture<ShelvesComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ShelvesComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ShelvesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
