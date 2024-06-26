import { ComponentFixture, TestBed } from '@angular/core/testing';

import { RolesListadoComponent } from './listRol.component';

describe('RolesListadoComponent', () => {
  let component: RolesListadoComponent;
  let fixture: ComponentFixture<RolesListadoComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [RolesListadoComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(RolesListadoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});