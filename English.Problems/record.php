#!/usr/bin/php
<?php

$default_voice='Samantha';
if($argc>1)
	$default_voice=trim($argv[1]);

$dbo=new SQLite3('../Math Explorer/MEDatabase.sqlite3', SQLITE3_OPEN_READONLY);
$problem_count=$dbo->querySingle('SELECT COUNT(id) FROM problems');
$problems=$dbo->prepare('SELECT problems.problem, noun_variables.sv1, noun_variables.sv2, noun_variables.ov1, noun_variables.ov2, num_variables.nv1, num_variables.nv2 FROM problems, noun_variables, num_variables, prob_var_map WHERE problems.id=prob_var_map.prob AND noun_variables.id=prob_var_map.noun_var AND num_variables.id=prob_var_map.num_var AND prob_var_map.lang=2 AND prob_var_map.prob=:probnum');

for($problem_num=1; $problem_num<=$problem_count; ++$problem_num) {
	$problems->bindParam(':probnum', $problem_num, SQLITE3_INTEGER);
	$problem_set=$problems->execute();
	$problem_dup_index=1;
	while($problem=$problem_set->fetchArray(SQLITE3_NUM)) {
		if(isset($problem)===false)
			break;
		
		$problem_str=trim(sprintf($problem[0], $problem[1], $problem[2], $problem[3], $problem[4], $problem[5], $problem[6]));
		$command_str=sprintf('say -v %s -o English_%02d-%02d.m4a --data-format alac -f ./read.txt', $default_voice, $problem_num, $problem_dup_index);
		$file=fopen('./read.txt', 'w');
		fwrite($file, $problem_str);
		fclose($file);
		unset($file, $problem_str);
		exec($command_str);
		++$problem_dup_index;
	}
	$problem_set->finalize();
	unset($problem_set, $problem_dup_index);
	$problems->reset();
}
$problems->close();
$dbo->close();
unset($problems, $problem_count, $dbo);
unlink('./read.txt');

?>