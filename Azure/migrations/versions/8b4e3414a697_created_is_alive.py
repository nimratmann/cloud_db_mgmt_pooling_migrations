"""created is alive

Revision ID: 8b4e3414a697
Revises: d87c85c0c6d8
Create Date: 2023-11-12 21:05:35.733363

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = '8b4e3414a697'
down_revision: Union[str, None] = 'd87c85c0c6d8'
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('patients', sa.Column('insurance', sa.String(length=100), nullable=False))
    # ### end Alembic commands ###


def downgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_column('patients', 'insurance')
    # ### end Alembic commands ###
