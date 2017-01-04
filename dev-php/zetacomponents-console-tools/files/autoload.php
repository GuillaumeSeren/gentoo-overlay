<?php
// @codingStandardsIgnoreFile
// @codeCoverageIgnoreStart
// this is an autogenerated file - do not edit
spl_autoload_register(
    function($class) {
        static $classes = null;
        if ($classes === null) {
            $classes = array(
                'ezcconsoleargument' => '/input/argument.php',
                'ezcconsoleargumentalreadyregisteredexception' => '/exceptions/argument_already_registered.php',
                'ezcconsoleargumentexception' => '/exceptions/argument.php',
                'ezcconsoleargumentmandatoryviolationexception' => '/exceptions/argument_mandatory_violation.php',
                'ezcconsolearguments' => '/input/arguments.php',
                'ezcconsoleargumenttypeviolationexception' => '/exceptions/argument_type_violation.php',
                'ezcconsoledialog' => '/interfaces/dialog.php',
                'ezcconsoledialogabortexception' => '/exceptions/dialog_abort.php',
                'ezcconsoledialogoptions' => '/options/dialog.php',
                'ezcconsoledialogvalidator' => '/interfaces/dialog_validator.php',
                'ezcconsoledialogviewer' => '/dialog_viewer.php',
                'ezcconsoleexception' => '/exceptions/exception.php',
                'ezcconsoleinput' => '/input.php',
                'ezcconsoleinputhelpgenerator' => '/interfaces/input_help_generator.php',
                'ezcconsoleinputstandardhelpgenerator' => '/input/help_generators/standard.php',
                'ezcconsoleinputvalidator' => '/interfaces/input_validator.php',
                'ezcconsoleinvalidoptionnameexception' => '/exceptions/invalid_option_name.php',
                'ezcconsoleinvalidoutputtargetexception' => '/exceptions/invalid_output_target.php',
                'ezcconsolemenudialog' => '/dialog/menu_dialog.php',
                'ezcconsolemenudialogdefaultvalidator' => '/dialog/validators/menu_dialog_default.php',
                'ezcconsolemenudialogoptions' => '/options/menu_dialog.php',
                'ezcconsolemenudialogvalidator' => '/interfaces/menu_dialog_validator.php',
                'ezcconsolenopositionstoredexception' => '/exceptions/no_position_stored.php',
                'ezcconsolenovaliddialogresultexception' => '/exceptions/no_valid_dialog_result.php',
                'ezcconsoleoption' => '/input/option.php',
                'ezcconsoleoptionalreadyregisteredexception' => '/exceptions/option_already_registered.php',
                'ezcconsoleoptionargumentsviolationexception' => '/exceptions/option_arguments_violation.php',
                'ezcconsoleoptiondependencyviolationexception' => '/exceptions/option_dependency_violation.php',
                'ezcconsoleoptionexception' => '/exceptions/option.php',
                'ezcconsoleoptionexclusionviolationexception' => '/exceptions/option_exclusion_violation.php',
                'ezcconsoleoptionmandatoryviolationexception' => '/exceptions/option_mandatory_violation.php',
                'ezcconsoleoptionmissingvalueexception' => '/exceptions/option_missing_value.php',
                'ezcconsoleoptionnoaliasexception' => '/exceptions/option_no_alias.php',
                'ezcconsoleoptionnotexistsexception' => '/exceptions/option_not_exists.php',
                'ezcconsoleoptionrule' => '/structs/option_rule.php',
                'ezcconsoleoptionstringnotwellformedexception' => '/exceptions/option_string_not_wellformed.php',
                'ezcconsoleoptiontoomanyvaluesexception' => '/exceptions/option_too_many_values.php',
                'ezcconsoleoptiontypeviolationexception' => '/exceptions/option_type_violation.php',
                'ezcconsoleoutput' => '/output.php',
                'ezcconsoleoutputformat' => '/structs/output_format.php',
                'ezcconsoleoutputformats' => '/structs/output_formats.php',
                'ezcconsoleoutputoptions' => '/options/output.php',
                'ezcconsoleprogressbar' => '/progressbar.php',
                'ezcconsoleprogressbaroptions' => '/options/progressbar.php',
                'ezcconsoleprogressmonitor' => '/progressmonitor.php',
                'ezcconsoleprogressmonitoroptions' => '/options/progressmonitor.php',
                'ezcconsolequestiondialog' => '/dialog/question_dialog.php',
                'ezcconsolequestiondialogcollectionvalidator' => '/dialog/validators/question_dialog_collection.php',
                'ezcconsolequestiondialogmappingvalidator' => '/dialog/validators/question_dialog_mapping.php',
                'ezcconsolequestiondialogoptions' => '/options/question_dialog.php',
                'ezcconsolequestiondialogregexvalidator' => '/dialog/validators/question_dialog_regex.php',
                'ezcconsolequestiondialogtypevalidator' => '/dialog/validators/question_dialog_type.php',
                'ezcconsolequestiondialogvalidator' => '/interfaces/question_dialog_validator.php',
                'ezcconsolestandardinputvalidator' => '/input/validators/standard.php',
                'ezcconsolestatusbar' => '/statusbar.php',
                'ezcconsolestatusbaroptions' => '/options/statusbar.php',
                'ezcconsolestringtool' => '/tools/string.php',
                'ezcconsoletable' => '/table.php',
                'ezcconsoletablecell' => '/table/cell.php',
                'ezcconsoletableoptions' => '/options/table.php',
                'ezcconsoletablerow' => '/table/row.php',
                'ezcconsoletoomanyargumentsexception' => '/exceptions/argument_too_many.php'
            );
        }
        $cn = strtolower($class);
        if (isset($classes[$cn])) {
            require __DIR__ . $classes[$cn];
        }
    },
    true,
    false
);
// @codeCoverageIgnoreEnd
require_once '/usr/share/php/zetacomponents/Base/autoload.php';
