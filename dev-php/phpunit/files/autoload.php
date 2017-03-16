<?php
/* Autoloader for dev-php/phpunit and its dependencies */

if (!class_exists('Fedora\\Autoloader\\Autoload', false)) {
    require_once '/usr/share/php/Fedora/Autoloader/autoload.php';
}

\Fedora\Autoloader\Autoload::addClassMap(
    array(
	'phpunit\\framework\\assert' => '/ForwardCompatibility/Assert.php',
	'phpunit\\framework\\basetestlistener' => '/ForwardCompatibility/BaseTestListener.php',
	'phpunit\\framework\\testcase' => '/ForwardCompatibility/TestCase.php',
	'phpunit\\framework\\testlistener' => '/ForwardCompatibility/TestListener.php',
	'phpunit_exception' => '/Exception.php',
	'phpunit_extensions_grouptestsuite' => '/Extensions/GroupTestSuite.php',
	'phpunit_extensions_phpttestcase' => '/Extensions/PhptTestCase.php',
	'phpunit_extensions_phpttestsuite' => '/Extensions/PhptTestSuite.php',
	'phpunit_extensions_repeatedtest' => '/Extensions/RepeatedTest.php',
	'phpunit_extensions_testdecorator' => '/Extensions/TestDecorator.php',
	'phpunit_extensions_ticketlistener' => '/Extensions/TicketListener.php',
	'phpunit_framework_assert' => '/Framework/Assert.php',
	'phpunit_framework_assertionfailederror' => '/Framework/AssertionFailedError.php',
	'phpunit_framework_basetestlistener' => '/Framework/BaseTestListener.php',
	'phpunit_framework_codecoverageexception' => '/Framework/CodeCoverageException.php',
	'phpunit_framework_constraint' => '/Framework/Constraint.php',
	'phpunit_framework_constraint_and' => '/Framework/Constraint/And.php',
	'phpunit_framework_constraint_arrayhaskey' => '/Framework/Constraint/ArrayHasKey.php',
	'phpunit_framework_constraint_arraysubset' => '/Framework/Constraint/ArraySubset.php',
	'phpunit_framework_constraint_attribute' => '/Framework/Constraint/Attribute.php',
	'phpunit_framework_constraint_callback' => '/Framework/Constraint/Callback.php',
	'phpunit_framework_constraint_classhasattribute' => '/Framework/Constraint/ClassHasAttribute.php',
	'phpunit_framework_constraint_classhasstaticattribute' => '/Framework/Constraint/ClassHasStaticAttribute.php',
	'phpunit_framework_constraint_composite' => '/Framework/Constraint/Composite.php',
	'phpunit_framework_constraint_count' => '/Framework/Constraint/Count.php',
	'phpunit_framework_constraint_directoryexists' => '/Framework/Constraint/DirectoryExists.php',
	'phpunit_framework_constraint_exception' => '/Framework/Constraint/Exception.php',
	'phpunit_framework_constraint_exceptioncode' => '/Framework/Constraint/ExceptionCode.php',
	'phpunit_framework_constraint_exceptionmessage' => '/Framework/Constraint/ExceptionMessage.php',
	'phpunit_framework_constraint_exceptionmessageregexp' => '/Framework/Constraint/ExceptionMessageRegExp.php',
	'phpunit_framework_constraint_fileexists' => '/Framework/Constraint/FileExists.php',
	'phpunit_framework_constraint_greaterthan' => '/Framework/Constraint/GreaterThan.php',
	'phpunit_framework_constraint_isanything' => '/Framework/Constraint/IsAnything.php',
	'phpunit_framework_constraint_isempty' => '/Framework/Constraint/IsEmpty.php',
	'phpunit_framework_constraint_isequal' => '/Framework/Constraint/IsEqual.php',
	'phpunit_framework_constraint_isfalse' => '/Framework/Constraint/IsFalse.php',
	'phpunit_framework_constraint_isfinite' => '/Framework/Constraint/IsFinite.php',
	'phpunit_framework_constraint_isidentical' => '/Framework/Constraint/IsIdentical.php',
	'phpunit_framework_constraint_isinfinite' => '/Framework/Constraint/IsInfinite.php',
	'phpunit_framework_constraint_isinstanceof' => '/Framework/Constraint/IsInstanceOf.php',
	'phpunit_framework_constraint_isjson' => '/Framework/Constraint/IsJson.php',
	'phpunit_framework_constraint_isnan' => '/Framework/Constraint/IsNan.php',
	'phpunit_framework_constraint_isnull' => '/Framework/Constraint/IsNull.php',
	'phpunit_framework_constraint_isreadable' => '/Framework/Constraint/IsReadable.php',
	'phpunit_framework_constraint_istrue' => '/Framework/Constraint/IsTrue.php',
	'phpunit_framework_constraint_istype' => '/Framework/Constraint/IsType.php',
	'phpunit_framework_constraint_iswritable' => '/Framework/Constraint/IsWritable.php',
	'phpunit_framework_constraint_jsonmatches' => '/Framework/Constraint/JsonMatches.php',
	'phpunit_framework_constraint_jsonmatches_errormessageprovider' => '/Framework/Constraint/JsonMatches/ErrorMessageProvider.php',
	'phpunit_framework_constraint_lessthan' => '/Framework/Constraint/LessThan.php',
	'phpunit_framework_constraint_not' => '/Framework/Constraint/Not.php',
	'phpunit_framework_constraint_objecthasattribute' => '/Framework/Constraint/ObjectHasAttribute.php',
	'phpunit_framework_constraint_or' => '/Framework/Constraint/Or.php',
	'phpunit_framework_constraint_pcrematch' => '/Framework/Constraint/PCREMatch.php',
	'phpunit_framework_constraint_samesize' => '/Framework/Constraint/SameSize.php',
	'phpunit_framework_constraint_stringcontains' => '/Framework/Constraint/StringContains.php',
	'phpunit_framework_constraint_stringendswith' => '/Framework/Constraint/StringEndsWith.php',
	'phpunit_framework_constraint_stringmatches' => '/Framework/Constraint/StringMatches.php',
	'phpunit_framework_constraint_stringstartswith' => '/Framework/Constraint/StringStartsWith.php',
	'phpunit_framework_constraint_traversablecontains' => '/Framework/Constraint/TraversableContains.php',
	'phpunit_framework_constraint_traversablecontainsonly' => '/Framework/Constraint/TraversableContainsOnly.php',
	'phpunit_framework_constraint_xor' => '/Framework/Constraint/Xor.php',
	'phpunit_framework_coveredcodenotexecutedexception' => '/Framework/CoveredCodeNotExecutedException.php',
	'phpunit_framework_error' => '/Framework/Error.php',
	'phpunit_framework_error_deprecated' => '/Framework/Error/Deprecated.php',
	'phpunit_framework_error_notice' => '/Framework/Error/Notice.php',
	'phpunit_framework_error_warning' => '/Framework/Error/Warning.php',
	'phpunit_framework_exception' => '/Framework/Exception.php',
	'phpunit_framework_exceptionwrapper' => '/Framework/ExceptionWrapper.php',
	'phpunit_framework_expectationfailedexception' => '/Framework/ExpectationFailedException.php',
	'phpunit_framework_incompletetest' => '/Framework/IncompleteTest.php',
	'phpunit_framework_incompletetestcase' => '/Framework/IncompleteTestCase.php',
	'phpunit_framework_incompletetesterror' => '/Framework/IncompleteTestError.php',
	'phpunit_framework_invalidcoverstargetexception' => '/Framework/InvalidCoversTargetException.php',
	'phpunit_framework_missingcoversannotationexception' => '/Framework/MissingCoversAnnotationException.php',
	'phpunit_framework_outputerror' => '/Framework/OutputError.php',
	'phpunit_framework_riskytest' => '/Framework/RiskyTest.php',
	'phpunit_framework_riskytesterror' => '/Framework/RiskyTestError.php',
	'phpunit_framework_selfdescribing' => '/Framework/SelfDescribing.php',
	'phpunit_framework_skippedtest' => '/Framework/SkippedTest.php',
	'phpunit_framework_skippedtestcase' => '/Framework/SkippedTestCase.php',
	'phpunit_framework_skippedtesterror' => '/Framework/SkippedTestError.php',
	'phpunit_framework_skippedtestsuiteerror' => '/Framework/SkippedTestSuiteError.php',
	'phpunit_framework_syntheticerror' => '/Framework/SyntheticError.php',
	'phpunit_framework_test' => '/Framework/Test.php',
	'phpunit_framework_testcase' => '/Framework/TestCase.php',
	'phpunit_framework_testfailure' => '/Framework/TestFailure.php',
	'phpunit_framework_testlistener' => '/Framework/TestListener.php',
	'phpunit_framework_testresult' => '/Framework/TestResult.php',
	'phpunit_framework_testsuite' => '/Framework/TestSuite.php',
	'phpunit_framework_testsuite_dataprovider' => '/Framework/TestSuite/DataProvider.php',
	'phpunit_framework_unintentionallycoveredcodeerror' => '/Framework/UnintentionallyCoveredCodeError.php',
	'phpunit_framework_warning' => '/Framework/Warning.php',
	'phpunit_framework_warningtestcase' => '/Framework/WarningTestCase.php',
	'phpunit_runner_basetestrunner' => '/Runner/BaseTestRunner.php',
	'phpunit_runner_exception' => '/Runner/Exception.php',
	'phpunit_runner_filter_factory' => '/Runner/Filter/Factory.php',
	'phpunit_runner_filter_group_exclude' => '/Runner/Filter/Group/Exclude.php',
	'phpunit_runner_filter_group_include' => '/Runner/Filter/Group/Include.php',
	'phpunit_runner_filter_groupfilteriterator' => '/Runner/Filter/Group.php',
	'phpunit_runner_filter_test' => '/Runner/Filter/Test.php',
	'phpunit_runner_standardtestsuiteloader' => '/Runner/StandardTestSuiteLoader.php',
	'phpunit_runner_testsuiteloader' => '/Runner/TestSuiteLoader.php',
	'phpunit_runner_version' => '/Runner/Version.php',
	'phpunit_textui_command' => '/TextUI/Command.php',
	'phpunit_textui_resultprinter' => '/TextUI/ResultPrinter.php',
	'phpunit_textui_testrunner' => '/TextUI/TestRunner.php',
	'phpunit_util_blacklist' => '/Util/Blacklist.php',
	'phpunit_util_configuration' => '/Util/Configuration.php',
	'phpunit_util_configurationgenerator' => '/Util/ConfigurationGenerator.php',
	'phpunit_util_errorhandler' => '/Util/ErrorHandler.php',
	'phpunit_util_fileloader' => '/Util/Fileloader.php',
	'phpunit_util_filesystem' => '/Util/Filesystem.php',
	'phpunit_util_filter' => '/Util/Filter.php',
	'phpunit_util_getopt' => '/Util/Getopt.php',
	'phpunit_util_globalstate' => '/Util/GlobalState.php',
	'phpunit_util_invalidargumenthelper' => '/Util/InvalidArgumentHelper.php',
	'phpunit_util_log_json' => '/Util/Log/JSON.php',
	'phpunit_util_log_junit' => '/Util/Log/JUnit.php',
	'phpunit_util_log_tap' => '/Util/Log/TAP.php',
	'phpunit_util_log_teamcity' => '/Util/Log/TeamCity.php',
	'phpunit_util_php' => '/Util/PHP.php',
	'phpunit_util_php_default' => '/Util/PHP/Default.php',
	'phpunit_util_php_windows' => '/Util/PHP/Windows.php',
	'phpunit_util_printer' => '/Util/Printer.php',
	'phpunit_util_regex' => '/Util/Regex.php',
	'phpunit_util_string' => '/Util/String.php',
	'phpunit_util_test' => '/Util/Test.php',
	'phpunit_util_testdox_nameprettifier' => '/Util/TestDox/NamePrettifier.php',
	'phpunit_util_testdox_resultprinter' => '/Util/TestDox/ResultPrinter.php',
	'phpunit_util_testdox_resultprinter_html' => '/Util/TestDox/ResultPrinter/HTML.php',
	'phpunit_util_testdox_resultprinter_text' => '/Util/TestDox/ResultPrinter/Text.php',
	'phpunit_util_testdox_resultprinter_xml' => '/Util/TestDox/ResultPrinter/XML.php',
	'phpunit_util_testsuiteiterator' => '/Util/TestSuiteIterator.php',
	'phpunit_util_type' => '/Util/Type.php',
	'phpunit_util_xml' => '/Util/XML.php',
),
  '/usr/share/php/PHPUnit'
);

// Dependencies
\Fedora\Autoloader\Dependencies::required(array(
  '/usr/share/php/File/Iterator/autoload.php',
  '/usr/share/php/PHP/CodeCoverage/autoload.php',
  '/usr/share/php/PHP/Timer/autoload.php',
  '/usr/share/php/SebastianBergmann/Version/autoload.php',
  '/usr/share/php/SebastianBergmann/Diff/autoload.php',
  '/usr/share/php/SebastianBergmann/Environment/autoload.php',
  '/usr/share/php/SebastianBergmann/Exporter/autoload.php',
  '/usr/share/php/SebastianBergmann/ObjectEnumerator/autoload.php',
  '/usr/share/php/SebastianBergmann/GlobalState/autoload.php',
  '/usr/share/php/SebastianBergmann/Comparator/autoload.php',
  '/usr/share/php/SebastianBergmann/ResourceOperations/autoload.php',
  '/usr/share/php/Symfony/Component/Yaml/autoload.php',
  '/usr/share/php/Text/Template/autoload.php',
  '/usr/share/php/myclabs/DeepCopy/autoload.php',
  '/usr/share/php/PHPUnit/Framework/MockObject/autoload.php',
  '/usr/share/php/phpspec/Prophecy/autoload.php',
));
