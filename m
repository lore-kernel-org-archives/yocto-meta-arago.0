Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 26341529A5
	for <meta-arago@arago-project.org>;
	Tue,  4 Feb 2020 20:25:50 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 014KNuBs029553;
	Tue, 4 Feb 2020 14:23:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1580847836;
	bh=Q7LBdMp4MBIvYYsvNVxDHrs1XI2B3Q+V5kbOfTvKvcI=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=b5F4qkJKshfdli+zuS0Hf6WEv0RnzFtUMmQsOgQ/nFkRH7Yev+kVtbCESJMi7Bq6d
	OhB/ATubYH8JrdOHaSKY+GE3FF6AOAhuEgoFHlksQ+Xfv7M6tR6H1LzzK+ZXdEW7yi
	Gh2MlO3R/p7TK15RFbd8u6JubTHQ9f0LMAaYxtgQ=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 014KNuBc129524;
	Tue, 4 Feb 2020 14:23:56 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Tue, 4 Feb 2020 14:23:56 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Tue, 4 Feb 2020 14:23:56 -0600
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 014KNtVi040304;
	Tue, 4 Feb 2020 14:23:55 -0600
To: Denys Dmytriyenko <denis@denix.org>, <meta-arago@arago-project.org>
References: <1580840296-30685-1-git-send-email-denis@denix.org>
	<1580840296-30685-2-git-send-email-denis@denix.org>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <ffee611a-04fa-5019-9786-7c16cae71e87@ti.com>
Date: Tue, 4 Feb 2020 15:23:55 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1580840296-30685-2-git-send-email-denis@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [RFC][PATCH 2/3] packagegroups: create initial ti-analytics and ti-demos packagegroups
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
X-List-Received-Date: Tue, 04 Feb 2020 20:25:50 -0000
Content-Type: multipart/alternative;
	boundary="------------E4566B55C48A014B75351317"
Content-Language: en-US

--------------E4566B55C48A014B75351317
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 2/4/2020 1:18 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>   .../recipes-core/images/tisdk-rootfs-image.bb      |  2 ++
>   .../packagegroup-arago-tisdk-addons.bb             | 36 +++-------------------
>   .../recipes-core/packagegroups/ti-analytics.bb     |  9 ++++++
>   .../recipes-core/packagegroups/ti-demos.bb         |  9 ++++++
>   .../recipes-core/packagegroups/ti-world.bb         |  2 ++
>   5 files changed, 27 insertions(+), 31 deletions(-)
>   create mode 100644 meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
>   create mode 100644 meta-arago-distro/recipes-core/packagegroups/ti-demos.bb
>
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
> index 1b2ffbd..ae026a1 100644
> --- a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
> +++ b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
> @@ -22,6 +22,8 @@ IMAGE_INSTALL += "\
>       packagegroup-arago-tisdk-addons \
>       packagegroup-arago-tisdk-addons-extra \
>       ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-hmi','packagegroup-arago-base-tisdk-server-extra',d)} \
> +    ti-analytics \
> +    ti-demos \
>   "
>   
>   export IMAGE_BASENAME = "tisdk-rootfs-image"
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> index 967fc5d..ddf7785 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> @@ -140,42 +140,16 @@ EXTRA_PACKAGES_omapl138 = " \
>       protobuf \
>   "
>   
> -ARMNN_PACKAGES = "armnn"
> -
> -EXTRA_PACKAGES_append_ti33x = " voxelsdk \
> -                                arm-compute-library \
> -                                ${ARMNN_PACKAGES} \
> -                                tensorflow-lite-examples \
> -                                pdm-anomaly-detection \
> -"
> -
> -EXTRA_PACKAGES_append_ti43x = " voxelsdk \
> -                                arm-compute-library \
> -                                ${ARMNN_PACKAGES} \
> -                                tensorflow-lite-examples \
> -                                pdm-anomaly-detection \
> -"
> -
> -EXTRA_PACKAGES_append_omap-a15 = " voxelsdk \
> -                                   big-data-ipc-demo-linux \
> -                                   big-data-ipc-demo-linux-firmware \
> -                                   arm-compute-library \
> -                                   ${ARMNN_PACKAGES} \
> -                                   tensorflow-lite-examples \
> -                                   pdm-anomaly-detection \
> -"
> -
> -EXTRA_PACKAGES_append_am65xx = " arm-compute-library \
> -                             ${ARMNN_PACKAGES} \
> -                             tensorflow-lite-examples \
> -                             pdm-anomaly-detection \
> -"
> -
>   EXTRA_PACKAGES_append_omap-a15 = " ti-ipc-examples-linux"
>   EXTRA_PACKAGES_append_keystone = " ti-ipc-examples-linux"
>   EXTRA_PACKAGES_append_omapl138 = " ti-ipc-examples-linux"
>   EXTRA_PACKAGES_append_am65xx = " ti-ipc-examples-linux"
>   
> +EXTRA_PACKAGES_append_omap-a15 = " \
> +    big-data-ipc-demo-linux \
> +    big-data-ipc-demo-linux-firmware \
> +"
> +
>   EXTRA_PACKAGES_append_am335x-evm = " pruss-lld-apps acontis-atemsys"
>   EXTRA_PACKAGES_append_am437x-evm = " pruss-lld-apps"
>   EXTRA_PACKAGES_append_am57xx-evm = " pruss-lld-apps acontis-atemsys"
> diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb b/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
> new file mode 100644
> index 0000000..e5a13f6
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
> @@ -0,0 +1,9 @@
> +SUMMARY = "TI World packagegroup"
> +LICENSE = "MIT"
> +
> +inherit packagegroup
> +
> +RDEPENDS_${PN} = "\
> +    armnn \
> +    tensorflow-lite-examples \
> +"
> diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb b/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb
> new file mode 100644
> index 0000000..20d73b9
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb
> @@ -0,0 +1,9 @@
> +SUMMARY = "TI World packagegroup"
> +LICENSE = "MIT"
> +
> +inherit packagegroup
> +
> +RDEPENDS_${PN} = "\
> +    voxelsdk \


voxelsdk was not marked as compatible with am65xx:


ERROR: Nothing RPROVIDES 'voxelsdk' (but /oe/bld/sources/meta-arago-bb/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb RDEPENDS on or otherwise requires it)
voxelsdk was skipped: incompatible with machine am65xx-evm (not in COMPATIBLE_MACHINE)


> +    pdm-anomaly-detection \
> +"
> diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
> index 1aa3a39..164ac63 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
> @@ -53,4 +53,6 @@ RDEPENDS_${PN} = "\
>       ${DEVTOOLS} \
>       ${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 'valgrind', '', d)} \
>       packagegroup-arago-misc \
> +    ti-analytics \
> +    ti-demos \
>   "

--------------E4566B55C48A014B75351317
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/4/2020 1:18 PM, Denys Dmytriyenko
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1580840296-30685-2-git-send-email-denis@denix.org">
      <pre class="moz-quote-pre" wrap="">From: Denys Dmytriyenko <a class="moz-txt-link-rfc2396E" href="mailto:denys@ti.com">&lt;denys@ti.com&gt;</a>

Signed-off-by: Denys Dmytriyenko <a class="moz-txt-link-rfc2396E" href="mailto:denys@ti.com">&lt;denys@ti.com&gt;</a>
---
 .../recipes-core/images/tisdk-rootfs-image.bb      |  2 ++
 .../packagegroup-arago-tisdk-addons.bb             | 36 +++-------------------
 .../recipes-core/packagegroups/ti-analytics.bb     |  9 ++++++
 .../recipes-core/packagegroups/ti-demos.bb         |  9 ++++++
 .../recipes-core/packagegroups/ti-world.bb         |  2 ++
 5 files changed, 27 insertions(+), 31 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/ti-demos.bb

diff --git a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
index 1b2ffbd..ae026a1 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
@@ -22,6 +22,8 @@ IMAGE_INSTALL += "\
     packagegroup-arago-tisdk-addons \
     packagegroup-arago-tisdk-addons-extra \
     ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-hmi','packagegroup-arago-base-tisdk-server-extra',d)} \
+    ti-analytics \
+    ti-demos \
 "
 
 export IMAGE_BASENAME = "tisdk-rootfs-image"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 967fc5d..ddf7785 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -140,42 +140,16 @@ EXTRA_PACKAGES_omapl138 = " \
     protobuf \
 "
 
-ARMNN_PACKAGES = "armnn"
-
-EXTRA_PACKAGES_append_ti33x = " voxelsdk \
-                                arm-compute-library \
-                                ${ARMNN_PACKAGES} \
-                                tensorflow-lite-examples \
-                                pdm-anomaly-detection \
-"
-
-EXTRA_PACKAGES_append_ti43x = " voxelsdk \
-                                arm-compute-library \
-                                ${ARMNN_PACKAGES} \
-                                tensorflow-lite-examples \
-                                pdm-anomaly-detection \
-"
-
-EXTRA_PACKAGES_append_omap-a15 = " voxelsdk \
-                                   big-data-ipc-demo-linux \
-                                   big-data-ipc-demo-linux-firmware \
-                                   arm-compute-library \
-                                   ${ARMNN_PACKAGES} \
-                                   tensorflow-lite-examples \
-                                   pdm-anomaly-detection \
-"
-
-EXTRA_PACKAGES_append_am65xx = " arm-compute-library \
-                             ${ARMNN_PACKAGES} \
-                             tensorflow-lite-examples \
-                             pdm-anomaly-detection \
-"
-
 EXTRA_PACKAGES_append_omap-a15 = " ti-ipc-examples-linux"
 EXTRA_PACKAGES_append_keystone = " ti-ipc-examples-linux"
 EXTRA_PACKAGES_append_omapl138 = " ti-ipc-examples-linux"
 EXTRA_PACKAGES_append_am65xx = " ti-ipc-examples-linux"
 
+EXTRA_PACKAGES_append_omap-a15 = " \
+    big-data-ipc-demo-linux \
+    big-data-ipc-demo-linux-firmware \
+"
+
 EXTRA_PACKAGES_append_am335x-evm = " pruss-lld-apps acontis-atemsys"
 EXTRA_PACKAGES_append_am437x-evm = " pruss-lld-apps"
 EXTRA_PACKAGES_append_am57xx-evm = " pruss-lld-apps acontis-atemsys"
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb b/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
new file mode 100644
index 0000000..e5a13f6
--- /dev/null
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
@@ -0,0 +1,9 @@
+SUMMARY = "TI World packagegroup"
+LICENSE = "MIT"
+
+inherit packagegroup
+
+RDEPENDS_${PN} = "\
+    armnn \
+    tensorflow-lite-examples \
+"
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb b/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb
new file mode 100644
index 0000000..20d73b9
--- /dev/null
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb
@@ -0,0 +1,9 @@
+SUMMARY = "TI World packagegroup"
+LICENSE = "MIT"
+
+inherit packagegroup
+
+RDEPENDS_${PN} = "\
+    voxelsdk \</pre>
    </blockquote>
    <p><br>
    </p>
    <p>voxelsdk was not marked as compatible with am65xx:</p>
    <p><br>
    </p>
    <pre style="color: rgb(0, 0, 0); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial; overflow-wrap: break-word; white-space: pre-wrap;">ERROR: Nothing RPROVIDES 'voxelsdk' (but /oe/bld/sources/meta-arago-bb/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb RDEPENDS on or otherwise requires it)
voxelsdk was skipped: incompatible with machine am65xx-evm (not in COMPATIBLE_MACHINE)</pre>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:1580840296-30685-2-git-send-email-denis@denix.org">
      <pre class="moz-quote-pre" wrap="">
+    pdm-anomaly-detection \
+"
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
index 1aa3a39..164ac63 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
@@ -53,4 +53,6 @@ RDEPENDS_${PN} = "\
     ${DEVTOOLS} \
     ${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 'valgrind', '', d)} \
     packagegroup-arago-misc \
+    ti-analytics \
+    ti-demos \
 "
</pre>
    </blockquote>
  </body>
</html>

--------------E4566B55C48A014B75351317--
