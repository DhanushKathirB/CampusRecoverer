-- Audit Module Schema: Immutable Append-Only Hash-Chained Trail

CREATE TABLE IF NOT EXISTS audit_logs (
  id VARCHAR(64) PRIMARY KEY,
  seq BIGSERIAL UNIQUE,
  actor_id VARCHAR(64) NOT NULL,
  action VARCHAR(64) NOT NULL,
  item_id VARCHAR(64),
  claim_id VARCHAR(64),
  metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
  prev_hash VARCHAR(64) NOT NULL,
  row_hash VARCHAR(64) NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_audit_logs_actor ON audit_logs(actor_id);
CREATE INDEX IF NOT EXISTS idx_audit_logs_action ON audit_logs(action);
CREATE INDEX IF NOT EXISTS idx_audit_logs_item ON audit_logs(item_id);
CREATE INDEX IF NOT EXISTS idx_audit_logs_claim ON audit_logs(claim_id);
CREATE INDEX IF NOT EXISTS idx_audit_logs_seq ON audit_logs(seq);
