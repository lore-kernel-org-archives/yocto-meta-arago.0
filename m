Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id AAE63529AE
	for <meta-arago@arago-project.org>;
	Mon, 11 May 2015 21:55:54 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4BLtqsn023515
	for <meta-arago@arago-project.org>; Mon, 11 May 2015 16:55:52 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4BLtqx2031784
	for <meta-arago@arago-project.org>; Mon, 11 May 2015 16:55:52 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 11 May 2015 16:55:52 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4BLtpU9010584;
	Mon, 11 May 2015 16:55:52 -0500
Date: Mon, 11 May 2015 17:55:51 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150511215551.GX8462@edge>
References: <1431106167-13234-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1431106167-13234-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] php: Fix race condition during installation.
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Mon, 11 May 2015 21:55:55 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, May 08, 2015 at 01:29:26PM -0400, Jacob Stiffler wrote:
> * The race condition manifests with the following error:
> 
> Installing PHP CLI binary:        /home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/work/x86_64-linux/php-native/5.4.14-r5.0-arago2/image/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/sysroots/x86_64-linux/usr/bin/
> Installing PHP CGI binary:        /home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/work/x86_64-linux/php-native/5.4.14-r5.0-arago2/image/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/sysroots/x86_64-linux/usr/bin/
> Installing build environment:     /home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/work/x86_64-linux/php-native/5.4.14-r5.0-arago2/image/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/sysroots/x86_64-linux/usr/lib/build/
> Installing helper programs:       /home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/work/x86_64-linux/php-native/5.4.14-r5.0-arago2/image/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/sysroots/x86_64-linux/usr/bin/
> Installing PEAR environment:      /home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/work/x86_64-linux/php-native/5.4.14-r5.0-arago2/image/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/sysroots/x86_64-linux/usr/lib/php/
> Installing PDO headers:          /home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/work/x86_64-linux/php-native/5.4.14-r5.0-arago2/image/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/sysroots/x86_64-linux/usr/include/php/ext/pdo/
> cp: cannot create regular file `/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/work/x86_64-linux/php-native/5.4.14-r5.0-arago2/image/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/sysroots/x86_64-linux/usr/bin/#INST@1289#': No such file or directory
> make: *** [install-cgi] Error 1
> make: *** Waiting for unfinished jobs....
> 
> * This issue was root caused to being a race condition when multiple
>   threads are used.
> * The PHP CGI bibary installation does not install the $bindir, PHP
>   CLI binary intalls the $bindir, so there is a slight chance that PHP
>   CGI will attempt to install its binaries before the $bindir is
>   created.
> * This patches the makefile so that installing the PHP CGI binaries
>   will also install the $bindir.
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  .../php/fix-race-condition-during-install.patch    |   10 ++++++++++
>  .../recipes-devtools/php/php_5.4.14.bbappend       |    4 +++-
>  2 files changed, 13 insertions(+), 1 deletion(-)
>  create mode 100644 meta-arago-distro/recipes-devtools/php/php/fix-race-condition-during-install.patch
> 
> diff --git a/meta-arago-distro/recipes-devtools/php/php/fix-race-condition-during-install.patch b/meta-arago-distro/recipes-devtools/php/php/fix-race-condition-during-install.patch
> new file mode 100644
> index 0000000..f4f3fb6
> --- /dev/null
> +++ b/meta-arago-distro/recipes-devtools/php/php/fix-race-condition-during-install.patch
> @@ -0,0 +1,10 @@
> +diff -rupN php-5.4.14/sapi/cgi/Makefile.frag php-5.4.14.0/sapi/cgi/Makefile.frag
> +--- php-5.4.14/sapi/cgi/Makefile.frag	2013-04-10 03:47:04.000000000 -0400
> ++++ php-5.4.14.0/sapi/cgi/Makefile.frag	2015-05-08 11:41:10.389484079 -0400
> +@@ -5,5 +5,6 @@ $(SAPI_CGI_PATH): $(PHP_GLOBAL_OBJS) $(P
> + 
> + install-cgi: $(SAPI_CGI_PATH)
> + 	@echo "Installing PHP CGI binary:        $(INSTALL_ROOT)$(bindir)/"
> ++	@$(mkinstalldirs) $(INSTALL_ROOT)$(bindir)
> + 	@$(INSTALL) -m 0755 $(SAPI_CGI_PATH) $(INSTALL_ROOT)$(bindir)/$(program_prefix)php-cgi$(program_suffix)$(EXEEXT)
> + 
> diff --git a/meta-arago-distro/recipes-devtools/php/php_5.4.14.bbappend b/meta-arago-distro/recipes-devtools/php/php_5.4.14.bbappend
> index ebf480c..f463233 100644
> --- a/meta-arago-distro/recipes-devtools/php/php_5.4.14.bbappend
> +++ b/meta-arago-distro/recipes-devtools/php/php_5.4.14.bbappend
> @@ -1,7 +1,9 @@
>  # look for files in this layer first
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>  
> -PR_append = "-arago2"
> +PR_append = "-arago3"
> +
> +SRC_URI_append = " files://fix-race-condition-during-install.patch"

Have you tested this patch? There's a typo above - file:// not files://

>  
>  SRC_URI_append_virtclass-native = " file://0001-php-native-Fix-host-contamination-issue.patch"
>  
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

