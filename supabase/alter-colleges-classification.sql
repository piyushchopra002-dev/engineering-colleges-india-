-- Add classification fields to colleges table
ALTER TABLE colleges
  ADD COLUMN IF NOT EXISTS institution_category TEXT,
  ADD COLUMN IF NOT EXISTS ownership_type TEXT,
  ADD COLUMN IF NOT EXISTS jurisdiction TEXT;

-- Optional: add check constraints for known values
ALTER TABLE colleges
  ADD CONSTRAINT colleges_institution_category_check
    CHECK (institution_category IS NULL OR institution_category IN (
      'IIT','NIT','IIIT','Government','Private','University','College','Deemed University'
    ));

ALTER TABLE colleges
  ADD CONSTRAINT colleges_ownership_type_check
    CHECK (ownership_type IS NULL OR ownership_type IN ('Government','Private','Public-Private'));

ALTER TABLE colleges
  ADD CONSTRAINT colleges_jurisdiction_check
    CHECK (jurisdiction IS NULL OR jurisdiction IN ('Central','State','UT'));
