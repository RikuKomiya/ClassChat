<template>
	<el-menu
	:default-active="activeIndex"
	mode="horizontal"
	>
	<el-menu-item index="1">
		<nuxt-link to="/">
			ClassChat
		</nuxt-link>
	</el-menu-item>
	<el-menu-item index="2">
		<nuxt-link to="/login">
		Login
		</nuxt-link>
	</el-menu-item>

	</el-menu>
</template>
