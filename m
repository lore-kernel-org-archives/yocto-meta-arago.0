Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 81B47529C7
	for <meta-arago@arago-project.org>;
	Mon, 25 Jun 2018 18:08:44 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w5PI8caH075274
	for <meta-arago@arago-project.org>; Mon, 25 Jun 2018 13:08:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1529950118;
	bh=40JtnNtJNSjJqANFcQsClqmmXcLzDLAbT9CGaD4mW+0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=bCx/909QlddB3uUMGQPaU/o2tLFJAjLZNPn8Hht2qKDd26HWyHb6aDWM9MuJ/odA7
	WdXzTjCZ4l7w9YO7DbIpExqQC3ExkI9cKrHuWB4omGWv+yGtZbtOR2mj+BNc4yV/1R
	9YnzDcPYR7vKHZzzvGqS6yPeLqPBrsTSZu5WymGc=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5PI8cAS000606
	for <meta-arago@arago-project.org>; Mon, 25 Jun 2018 13:08:38 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 25 Jun 2018 13:08:38 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 25 Jun 2018 13:08:38 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5PI8cYE008073;
	Mon, 25 Jun 2018 13:08:38 -0500
Date: Mon, 25 Jun 2018 14:07:39 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20180625180739.GB2344@beryl>
References: <1529644668-63037-1-git-send-email-a0393906@ti.com>
	<1529644668-63037-2-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
In-Reply-To: <1529644668-63037-2-git-send-email-a0393906@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [rocko 2/3] wayland-ivi-extension: Update to version 2.1.0
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
X-List-Received-Date: Mon, 25 Jun 2018 18:08:44 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Jun 22, 2018 at 10:47:47AM +0530, Karthik Ramanan wrote:
> This version is compatible with weston 2.0.0
> 
> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  .../wayland/wayland-ivi-extension_1.11.0.bb        | 33 ----------------------
>  .../wayland/wayland-ivi-extension_2.1.0.bb         | 31 ++++++++++++++++++++
>  2 files changed, 31 insertions(+), 33 deletions(-)
>  delete mode 100644 meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_1.11.0.bb
>  create mode 100644 meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_2.1.0.bb

To simplify review, please make it as a diff (-M/-C flags) between old and new.


> diff --git a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_1.11.0.bb b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_1.11.0.bb
> deleted file mode 100644
> index 75e284f..0000000
> --- a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_1.11.0.bb
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -SUMMARY = "Wayland IVI Extension"
> -DESCRIPTION = "GENIVI Layer Management API based on Wayland IVI Extension"
> -HOMEPAGE = "http://projects.genivi.org/wayland-ivi-extension"
> -BUGTRACKER = "http://bugs.genivi.org/enter_bug.cgi?product=Wayland%20IVI%20Extension"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=1f1a56bb2dadf5f2be8eb342acf4ed79"
> -
> -SRCREV = "c9001582b10ce209c37b42dd560947c5aa8928b3"
> -
> -SRC_URI = "git://github.com/GENIVI/${BPN}.git;protocol=http \
> -           file://force-type-conversion.patch \
> -           file://0001-layer-add-surfaces-Add-screenId-as-an-argument.patch \
> -           file://0002-layer-add-surfaces-surface-layer-management.patch \
> -    "
> -
> -S = "${WORKDIR}/git"
> -
> -DEPENDS = "weston virtual/libgles2 pixman wayland-native"
> -
> -inherit cmake
> -
> -EXTRA_OECMAKE := "-DWITH_ILM_INPUT=1"
> -
> -FILES_${PN} += "${libdir}/weston/*"
> -FILES_${PN}-dbg += "${libdir}/weston/.debug/*"
> -
> -EXTRA_OECMAKE += "-DLIB_SUFFIX=${@d.getVar('baselib', True).replace('lib', '')}"
> -
> -PR = "r3"
> -
> -# Need these temporarily to prevent a non-fatal do_package_qa issue
> -INSANE_SKIP_${PN} += "dev-deps"
> -INSANE_SKIP_${PN}-dev += "dev-elf dev-so"
> diff --git a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_2.1.0.bb b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_2.1.0.bb
> new file mode 100644
> index 0000000..894d1b8
> --- /dev/null
> +++ b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_2.1.0.bb
> @@ -0,0 +1,31 @@
> +SUMMARY = "Wayland IVI Extension"
> +DESCRIPTION = "GENIVI Layer Management API based on Wayland IVI Extension"
> +HOMEPAGE = "http://projects.genivi.org/wayland-ivi-extension"
> +BUGTRACKER = "http://bugs.genivi.org/enter_bug.cgi?product=Wayland%20IVI%20Extension"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=1f1a56bb2dadf5f2be8eb342acf4ed79"
> +
> +SRCREV = "d2c2e262f3bdc9db33b3014293fcdbcfdc90ab27"
> +
> +SRC_URI = "git://github.com/GENIVI/${BPN}.git;protocol=http \
> +           file://force-type-conversion.patch \
> +    "
> +
> +S = "${WORKDIR}/git"
> +
> +DEPENDS = "weston virtual/libgles2 pixman wayland-native"
> +
> +inherit cmake
> +
> +EXTRA_OECMAKE := "-DWITH_ILM_INPUT=1"
> +
> +FILES_${PN} += "${libdir}/weston/*"
> +FILES_${PN}-dbg += "${libdir}/weston/.debug/*"
> +
> +EXTRA_OECMAKE += "-DLIB_SUFFIX=${@d.getVar('baselib', True).replace('lib', '')}"
> +
> +PR = "r1"
> +
> +# Need these temporarily to prevent a non-fatal do_package_qa issue
> +INSANE_SKIP_${PN} += "dev-deps"
> +INSANE_SKIP_${PN}-dev += "dev-elf dev-so"
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

