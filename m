Return-Path: <nm@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 7AD25529FC
	for <meta-arago@arago-project.org>;
	Wed, 17 Mar 2021 01:21:44 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12H1M09X106689;
	Tue, 16 Mar 2021 20:22:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1615944120;
	bh=AhPKkGh+jhAV1XQpuL2IOEmN8F62NidhpARu+tHTcmI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Lh8lTyGSqkwpQv+lh+3nOnvShsOwt1fBMvNfEDwDzwP+z5k3cHQmCR5DgQ3KFwbrZ
	IuUkpXtgaKeROobZEPHyoptIIL6A0/0mul1b0cy0tLlGQQnzdd7GhgLnpPX/Tsin+e
	PJ/n+8WjEMbTRMd8E9oOXFmZJbaYcaKwd3rNc4hk=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12H1M0HR011891
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 Mar 2021 20:22:00 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Tue, 16 Mar 2021 20:22:00 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Tue, 16 Mar 2021 20:22:00 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12H1M0Wa065095;
	Tue, 16 Mar 2021 20:22:00 -0500
Date: Tue, 16 Mar 2021 20:22:00 -0500
From: Nishanth Menon <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Message-ID: <20210317012200.fao7bymh7zdlwmx5@affair>
References: <1615924690-45022-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1615924690-45022-1-git-send-email-denis@denix.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org, Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [dunfell/master][PATCH] opencv: drop deprecated bbappend for DSP-offloading
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
X-List-Received-Date: Wed, 17 Mar 2021 01:21:45 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 15:58-20210316, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> DSP-offloading to OpenCL hasn't been updated for ~3 years [1] and is based
> on version 3.1, which is no longer available. Remove remaining bbappend.
> 
> [1] https://git.ti.com/cgit/opencv/tiopencv/log/?h=tiopencvrelease_3.1

Thanks.

Acked-by: Nishanth Menon <nm@ti.com>

Also tested to confirm this gets rid of the following:

WARNING: No recipes available for:
  /workdir/pub-sdk/oe-layersetup/sources/meta-arago/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>  .../recipes-support/opencv/opencv_3.1.bbappend     | 41 ----------------------
>  1 file changed, 41 deletions(-)
>  delete mode 100644 meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend
> 
> diff --git a/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend b/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend
> deleted file mode 100644
> index a87e832..0000000
> --- a/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -PR = "r3"
> -
> -BRANCH = "tiopencvrelease_3.1"
> -
> -SRC_URI_remove = "git://github.com/Itseez/opencv.git;name=opencv"
> -SRC_URI_prepend = "git://git.ti.com/opencv/tiopencv.git;protocol=git;branch=${BRANCH};name=opencv"
> -
> -FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> -
> -SRC_URI_append += "\
> -     file://setupEnv.sh \
> -"
> -
> -SRCREV_opencv = "102577cf10416ca8180adda88d3fd801eebc6318"
> -
> -DEPENDS_remove_keystone = "qtbase"
> -
> -PACKAGE_ARCH = "${MACHINE_ARCH}"
> -
> -PACKAGECONFIG_QTWAYLAND = "${@bb.utils.contains("DISTRO_FEATURES", "wayland", "qtwayland", "", d)}"
> -PACKAGECONFIG_QTWAYLAND_keystone = ""
> -
> -PACKAGECONFIG_append = " ${PACKAGECONFIG_QTWAYLAND} \
> -                         ${@bb.utils.contains('MACHINE_FEATURES','dsp','opencl', '', d)} \
> -"
> -
> -PACKAGECONFIG_remove = "python3"
> -PACKAGECONFIG_remove = "python2"
> -
> -inherit cmake_qt5
> -
> -PACKAGECONFIG[opencl] = "-DWITH_OPENCL=ON -DCMAKE_CXX_FLAGS_RELEASE="${CMAKE_CXX_FLAGS_RELEASE} -DCV_TIOPENCL -DCV_TIOPENCL_ENABLE_PROGRAM_COUNT -DMAX_PROGRAM_HASH_SIZE=50" -DCMAKE_C_FLAGS_RELEASE="${CMAKE_C_FLAGS_RELEASE} -DCV_TIOPENCL -DCV_TIOPENCL_ENABLE_PROGRAM_COUNT -DMAX_PROGRAM_HASH_SIZE=50" -DWITH_OPENCLAMDFFT=OFF -DWITH_OPENCLAMDBLAS=OFF,-DWITH_OPENCL=OFF,cmem opencl,"
> -PACKAGECONFIG[qtwayland] = "-DWITH_QT=ON,-DWITH_QT=OFF,qtwayland,"
> -
> -do_install_append() {
> -    install -d ${D}${datadir}/OpenCV/samples/bin/
> -    install -d ${D}${datadir}/OpenCV/titestsuite/
> -    cp -f bin/*_test_* ${D}${datadir}/OpenCV/samples/bin/
> -    cp -f ${S}/titestsuite/* ${D}${datadir}/OpenCV/titestsuite/
> -    cp -f ${WORKDIR}/setupEnv.sh ${D}${datadir}/OpenCV/titestsuite/
> -}
> -- 
> 2.7.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

