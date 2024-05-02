import { TestBed } from '@angular/core/testing';

import { CargosServiceService } from './cargos-service.service';

describe('DepartamentoServiceService', () => {
  let service: CargosServiceService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(CargosServiceService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
