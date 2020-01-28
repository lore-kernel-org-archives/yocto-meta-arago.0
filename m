Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 8E2E25298B
	for <meta-arago@arago-project.org>;
	Tue, 28 Jan 2020 23:47:31 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00SNjewl006871
	for <meta-arago@arago-project.org>; Tue, 28 Jan 2020 17:45:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1580255140;
	bh=M+9ICVhS3N+bSe5wDC/rJsUqmy6BBmBojYVTkQ5WOn4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=o9NaCt5F0yjnU13fFWVz2pZpjRmfKhsC6U9bCKL5EPqf2tRXvDrKSXd044Loz+w0u
	T72P8cxEdDlfhUoZGu0AnOK7vhXv4Y55R4hbvAEma9cyvN6j8LqR7PR8b4Ti3hGk6H
	+Fv7pEkVPKaMaUab+TGVtmGUnTZWfAmJBiodyRMA=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00SNjeWY022805
	for <meta-arago@arago-project.org>; Tue, 28 Jan 2020 17:45:40 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Tue, 28 Jan 2020 17:45:39 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Tue, 28 Jan 2020 17:45:39 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00SNjdfC113795;
	Tue, 28 Jan 2020 17:45:39 -0600
Date: Tue, 28 Jan 2020 18:45:39 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Gowtham Tammana <g-tammana@ti.com>
Message-ID: <20200128234539.GH3658@beryl>
References: <20200122173626.11984-1-g-tammana@ti.com>
MIME-Version: 1.0
In-Reply-To: <20200122173626.11984-1-g-tammana@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org, vijayp@ti.com
Subject: Re: [thud/zeus/master][PATCH] recipes-graphics: Add recipe for DevIL
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
X-List-Received-Date: Tue, 28 Jan 2020 23:47:31 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Jan 22, 2020 at 11:36:26AM -0600, Gowtham Tammana wrote:
> Developers Image Library (DevIL) is a cross-platfor image utility
> library with simple syntax (openil.sourceforge.net). Adding recipe to
> build from sources.

Where is it coming from? I see there are many copies in other layers - is it 
based on something or completely done from scratch?


> Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
> ---
>  .../recipes-graphics/devil/devil_1.8.0.bb     | 30 +++++++++++++++++++
>  .../devil/files/Remove-ILUT-dependency.patch  | 13 ++++++++
>  2 files changed, 43 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-graphics/devil/devil_1.8.0.bb
>  create mode 100644 meta-arago-extras/recipes-graphics/devil/files/Remove-ILUT-dependency.patch
> 
> diff --git a/meta-arago-extras/recipes-graphics/devil/devil_1.8.0.bb b/meta-arago-extras/recipes-graphics/devil/devil_1.8.0.bb
> new file mode 100644
> index 00000000..6ba7f34b
> --- /dev/null
> +++ b/meta-arago-extras/recipes-graphics/devil/devil_1.8.0.bb
> @@ -0,0 +1,30 @@
> +DESCRIPTION = "Developer's Image Library (DevIL) is a cross-platform image \
> +               library utilizing simple syntax to load, save, convert, \
> +               manipulate, filter and display a variety of images."

Would also need a short SUMMARY set.


> +HOMEPAGE = "https://github.com/DentonW/DevIL"
> +LICENSE = "LGPLv2"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=fc178bcd425090939a8b634d1d6a9594"
> +
> +SRC_URI = "git://github.com/dentonw/devil.git;protocol=git;branch=master \
> +           file://Remove-ILUT-dependency.patch"
> +
> +SRCREV = "e34284a7e07763769f671a74b4fec718174ad862"
> +
> +COMPATIBLE_MACHINE = "j7-evm"

Is it really compatible with j7 only? Looks to me as rather generic...


> +
> +PR = "r1"
> +S = "${WORKDIR}/git"
> +
> +# Build only DevIL
> +OECMAKE_SOURCEPATH = "${S}/DevIL"
> +
> +PACKAGECONFIG ??= "png"
> +PACKAGECONFIG[png] = "-DIL_NO_PNG=0,-DIL_NO_PNG=1,libpng,"
> +
> +DEPENDS += "libpng"

Dependency on libpng should be taken care by the PACKAGECONFIG above.


> +inherit pkgconfig cmake
> +
> +INSANE_SKIP_${PN} += "file-rdeps dev-so"
> +FILES_${PN} += "${libdir}/lib*${SOLIBSDEV}"
> +FILES_SOLIBSDEV = ""

Any way to package the libraries properly and not suppress QA checks?


> diff --git a/meta-arago-extras/recipes-graphics/devil/files/Remove-ILUT-dependency.patch b/meta-arago-extras/recipes-graphics/devil/files/Remove-ILUT-dependency.patch
> new file mode 100644
> index 00000000..4f0f9dfa
> --- /dev/null
> +++ b/meta-arago-extras/recipes-graphics/devil/files/Remove-ILUT-dependency.patch
> @@ -0,0 +1,13 @@
> +diff --git a/DevIL/CMakeLists.txt b/DevIL/CMakeLists.txt
> +index e342f93d..fae40167 100644
> +--- a/DevIL/CMakeLists.txt
> ++++ b/DevIL/CMakeLists.txt
> +@@ -6,7 +6,7 @@ set (CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake/Modules")
> + 
> + add_subdirectory(src-IL)
> + add_subdirectory(src-ILU)
> +-add_subdirectory(src-ILUT)
> ++# add_subdirectory(src-ILUT)
> + option(IL_TESTS "build DevIL tests" ON)
> + if (IL_TESTS)
> +     ENABLE_TESTING()
> -- 
> 2.25.0
> 

