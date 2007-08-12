#include "global.h"
#include "TrailUtil.h"
#include "Trail.h"
#include "Course.h"
#include "XmlFile.h"
#include "GameManager.h"


void TrailID::FromTrail( const Trail *p )
{
	if( p == NULL )
	{
		st = StepsType_Invalid;
		cd = Difficulty_Invalid;
	}
	else
	{
		st = p->m_StepsType;
		cd = p->m_CourseDifficulty;
	}
	m_Cache.Unset();
}

Trail *TrailID::ToTrail( const Course *p, bool bAllowNull ) const
{
	ASSERT( p );

	Trail *pRet = NULL;
	if( !m_Cache.Get(&pRet) )
	{
		if( st != StepsType_Invalid && cd != Difficulty_Invalid )
			pRet = p->GetTrail( st, cd );
		m_Cache.Set( pRet );
	}

	if( !bAllowNull && pRet == NULL )
		RageException::Throw( "%i, %i, \"%s\"", st, cd, p->GetDisplayFullTitle().c_str() );	

	return pRet;
}

XNode* TrailID::CreateNode() const
{
	XNode* pNode = new XNode( "Trail" );

	pNode->AppendAttr( "StepsType", GameManager::StepsTypeToString(st) );
	pNode->AppendAttr( "CourseDifficulty", DifficultyToString(cd) );

	return pNode;
}

void TrailID::LoadFromNode( const XNode* pNode ) 
{
	ASSERT( pNode->GetName() == "Trail" );

	RString sTemp;

	pNode->GetAttrValue( "StepsType", sTemp );
	st = GameManager::StringToStepsType( sTemp );

	pNode->GetAttrValue( "CourseDifficulty", sTemp );
	cd = StringToDifficulty( sTemp );
	m_Cache.Unset();
}

RString TrailID::ToString() const
{
	RString s = GameManager::StepsTypeToString( st );
	s += " " + DifficultyToString( cd );
	return s;
}

bool TrailID::IsValid() const
{
	return st != StepsType_Invalid && cd != Difficulty_Invalid;
}

bool TrailID::operator<( const TrailID &rhs ) const
{
#define COMP(a) if(a<rhs.a) return true; if(a>rhs.a) return false;
	COMP(st);
	COMP(cd);
#undef COMP
	return false;
}

/*
 * (c) 2004 Chris Danford
 * All rights reserved.
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, and/or sell copies of the Software, and to permit persons to
 * whom the Software is furnished to do so, provided that the above
 * copyright notice(s) and this permission notice appear in all copies of
 * the Software and that both the above copyright notice(s) and this
 * permission notice appear in supporting documentation.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
 * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT OF
 * THIRD PARTY RIGHTS. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR HOLDERS
 * INCLUDED IN THIS NOTICE BE LIABLE FOR ANY CLAIM, OR ANY SPECIAL INDIRECT
 * OR CONSEQUENTIAL DAMAGES, OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS
 * OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
 * OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
 * PERFORMANCE OF THIS SOFTWARE.
 */
