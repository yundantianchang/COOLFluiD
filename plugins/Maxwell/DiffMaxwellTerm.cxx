#include "Maxwell/DiffMaxwellTerm.hh"

//////////////////////////////////////////////////////////////////////////////

using namespace std;
using namespace COOLFluiD::Framework;
using namespace COOLFluiD::Common;

//////////////////////////////////////////////////////////////////////////////

namespace COOLFluiD {

  namespace Physics {

    namespace Maxwell {

//////////////////////////////////////////////////////////////////////////////

void DiffMaxwellTerm::defineConfigOptions(Config::OptionList& options)
{
}
      
//////////////////////////////////////////////////////////////////////////////

DiffMaxwellTerm::DiffMaxwellTerm(const std::string& name) :
  BaseTerm(name)
{
  addConfigOptionsTo(this);
}

//////////////////////////////////////////////////////////////////////////////

DiffMaxwellTerm::~DiffMaxwellTerm()
{
}

//////////////////////////////////////////////////////////////////////////////

void DiffMaxwellTerm::configure ( Config::ConfigArgs& args )
{
  BaseTerm::configure(args);
}

//////////////////////////////////////////////////////////////////////////////

void DiffMaxwellTerm::setupPhysicalData()
{
  // resize the physical data
  cf_assert(getDataSize() > 0);

  m_physicalData.resize(getDataSize());
  m_refPhysicalData.resize(getDataSize());
}

//////////////////////////////////////////////////////////////////////////////

    } // namespace Maxwell

  } // namespace Physics

} // namespace COOLFluiD

//////////////////////////////////////////////////////////////////////////////