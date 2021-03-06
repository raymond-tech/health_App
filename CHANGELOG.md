# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [0.8.0] - [2020-04-04]
### Changed
- Attemp to serialize all properties with 'date' in the name to ChangeHealth date format

## [0.7.0] - [2020-04-03]
### Changed
- Fixed bug in serializing date on subscriber and encounter

## [0.6.0] - [2020-04-02]
### Changed
- Added Indifferent Access to hashes
- Fixed bug with Authentication endpoint

## [0.5.0] - [2020-03-11]
### Added
- EligibilityBenefit Deductible information
- EligibilityBenefit benefits date information
- EligibilityBenefit(s) child
- EligibilityBenefit(s) employee
- EligibilityBenefit(s) family
- EligibilityBenefit(s) employee and child

### Changed
- Broke EligibilityBenefit and EligibilityBenefits into separate files

## [0.4.0] - [2020-03-10]
### Added
- EligibilityBenefit(s) Employee information
- EligibilityData plan date information
- EligibilityData eligibility, plan and service date helpers on date info

## [0.3.0] - [2020-03-09]
### Added
- Production endpoint

## [0.2.0] - [2020-03-09]
### Added
- EligibilityData
- EligibilityBenefit
- EligibilityBenefits

### Changed
- Eligibility.query returns EligibilityData object

## [0.1.0] - 2020-03-04
### Added
- Provider
- Subscriber
- Encounter
- Eligibility 
- Authentication
- Configuration

[0.8.0]: https://github.com/WeInfuse/change_health/compare/v0.7.0...v0.8.0
[0.7.0]: https://github.com/WeInfuse/change_health/compare/v0.6.0...v0.7.0
[0.6.0]: https://github.com/WeInfuse/change_health/compare/v0.5.0...v0.6.0
[0.5.0]: https://github.com/WeInfuse/change_health/compare/v0.4.0...v0.5.0
[0.4.0]: https://github.com/WeInfuse/change_health/compare/v0.3.0...v0.4.0
[0.3.0]: https://github.com/WeInfuse/change_health/compare/v0.2.0...v0.3.0
[0.2.0]: https://github.com/WeInfuse/change_health/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/WeInfuse/change_health/compare/v0.1.0
