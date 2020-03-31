{**
 * templates/localeFile.tpl
 *
 * Copyright (c) 2016-2020 Language Science Press
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 *}

<form class="pkp_form" id="localeFilesForm" method="post" action="{url router=$smarty.const.ROUTE_COMPONENT component="plugins.generic.customLocale.controllers.grid.CustomLocaleGridHandler" op="updateLocale" currentPage=$currentPage locale=$locale key=$filePath anchor="localeContents"}">
	<link rel="stylesheet" href="{$baseUrl}/plugins/generic/customLocale/css/customLocale.css" type="text/css" />
	<div id="customLocales">
		<div class="customLocales__search">
			<label for="customLocalesSearch">
				{translate key="common.search"}
			</label>
			<input
				type="search"
				v-model="searchPhrase"
				@keydown.enter.prevent="search"
			/>
			<button	type="button" @click.prevent="search">{translate key="common.search"}</button>
		</div>
		<div class="customLocales_pages">
			Pages:
			<button
				v-for="i in maxPages"
				:key="i"
				type="button"
				@click="() => (currentPage = i)"
			>
				{{ i }}
			</button>
		</div>
		<table>
			<tr v-for="localeKey in currentLocaleKeys" :key="localeKey.localeKey">
				<td>{{ localeKey.localeKey }}</td>
				<td>{{ localeKey.value }}</td>
				<td>
					<input
						type="text"
						:name="'changes[' + localeKey.localeKey + ']'"
						:value="edited[localeKey.localeKey]"
					>
				</td>
			</tr>
		</table>
		{fbvFormButtons id="submitCustomLocaleFileTemplate" submitText="plugins.generic.customLocale.saveAndContinue"}
	</div>
	<script type="text/javascript">
		$(function() {ldelim}
			// Attach the form handler.
			$('#localeFilesForm').pkpHandler('$.pkp.controllers.form.AjaxFormHandler');
		{rdelim});

		{if $localeContents}
			customLocalesApp.data.edited = {$localeContents|json_encode};
		{/if}
		customLocalesApp.data.localeKeys = {$referenceLocaleContentsArray|json_encode};
		new pkp.Vue(customLocalesApp);
	</script>
</form>