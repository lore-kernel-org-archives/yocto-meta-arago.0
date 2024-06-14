Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECE09C27C6E
	for <webhook@archiver.kernel.org>; Fri, 14 Jun 2024 13:35:59 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.11746.1718372156967385439
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 14 Jun 2024 06:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=df//W3aq;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45EDZtie007753;
	Fri, 14 Jun 2024 08:35:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718372155;
	bh=2y4sASZnRsYSkywMISUN8RyoguAL6IujYQtH2/Jworo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=df//W3aq8HbDP/TwmGQZfTgvwguavnoD4o3h6g6o7R3btTWTI9oUKglIKCv5cl/BC
	 OvDuNhKYEos6jqZQmsbBQ8dSPfNtsorN2NNKsf/Up2ekNjxQ6kv8vqL3fhyhj5EoDu
	 ZxzEwo6/FmulK7EHOhAmlEp/8IKKLwZz2Gcb/I9U=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45EDZtL8102193
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 14 Jun 2024 08:35:55 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 14
 Jun 2024 08:35:55 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 14 Jun 2024 08:35:55 -0500
Received: from [10.249.34.39] ([10.249.34.39])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45EDZtN1000401;
	Fri, 14 Jun 2024 08:35:55 -0500
Message-ID: <cfc47a6b-c11b-4fba-9f79-292a210e4f98@ti.com>
Date: Fri, 14 Jun 2024 08:35:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-arago][master][PATCH] recipes: Add missing
 Upstream-Status to patch files
To: Chirag Shilwant <c-shilwant@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>, Gyan Gupta <g-gupta@ti.com>
References: <20240613160028.6665-1-reatmon@ti.com>
 <0a5606fc-cd38-4120-bf5f-b374b50539be@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <0a5606fc-cd38-4120-bf5f-b374b50539be@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 45EDZtie007753
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 14 Jun 2024 13:35:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15386


That's a whole different effort.  We should go through ALL of the=20
recipes in meta-arago and decide if we still need them, or if they need=20
to be updated, or whatever.


On 6/14/2024 1:35 AM, Chirag Shilwant wrote:
> Hi Ryan,
>=20
> On a side note, can you help me understand whether all these patches ar=
e=20
> still needed?
> As I see few patches that were created 10 years back!
>=20
> On 13/06/24 21:30, Ryan Eatmon via lists.yoctoproject.org wrote:
>> Now that master requires Upstream-Status for all layers we need to=20
>> clean up the meta-arago layers. Signed-off-by: Ryan Eatmon <reatmon@=20
>> =E2=80=8Ati.=E2=80=8Acom> --- ..=E2=80=8A.=E2=80=8A/pm-qa/0001-Return-=
non-zero-value-on-test-failure.=20
>> =E2=80=8Apatch | 2 ++ ..=E2=80=8A.=E2=80=8A/pm-qa/pm-qa/0002-cpuidle-A=
void-relative-paths.=E2=80=8Apatch
>> ZjQcmQRYFpfptBannerStart
>> This message was sent from outside of Texas Instruments.
>> Do not click links or open attachments unless you recognize the source=
=20
>> of this email and know the content is safe. If you wish to report this=
=20
>> message to IT Security, please forward the message as an attachment to=
=20
>> phishing@list.ti.com
>> ZjQcmQRYFpfptBannerEnd
>> Now that master requires Upstream-Status for all layers we need to cle=
an
>> up the meta-arago layers.
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>> =C2=A0 .../pm-qa/0001-Return-non-zero-value-on-test-failure.patch=C2=A0=
=C2=A0=C2=A0=C2=A0 | 2 ++
>> =C2=A0 .../pm-qa/pm-qa/0002-cpuidle-Avoid-relative-paths.patch=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 ++
>> =C2=A0 .../0001-layer-add-surfaces-Add-screenId-as-an-argument.patch=C2=
=A0 | 2 ++
>> =C2=A0 .../0002-layer-add-surfaces-surface-layer-management.patch=C2=A0=
=C2=A0=C2=A0=C2=A0 | 2 ++
>> =C2=A0 .../wayland/wayland-ivi-extension/force-type-conversion.patch=C2=
=A0 | 3 +++
>> =C2=A0 ...-calculator-Add-exit-button-for-non-window-environmen.patch =
| 2 ++
>> =C2=A0 .../qt5/qtbase/0001-deform-Fix-how-controls-are-shown.patch=C2=A0=
=C2=A0=C2=A0 | 2 ++
>> =C2=A0 ...-animatedtiles-Add-exit-button-for-non-window-environ.patch =
| 2 ++
>> =C2=A0 .../qt5/qtbase/0002-deform-disable-opengl-button.patch=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 ++
>> =C2=A0 .../0001-touchinteraction.qml-Add-exit-button.patch=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 ++
>> =C2=A0 ...-Target.pri-update-to-use-GL_NoX-version-of-GraphicsS.patch =
| 2 ++
>> =C2=A0 .../recipes-qt/qt5/qtwebkit/GraphicsContext3DQt.cpp.patch=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 3 +++
>> =C2=A0 .../recipes-qt/qt5/qtwebkit/GraphicsSurfaceGL_NoX.cpp.patch=C2=A0=
=C2=A0=C2=A0 | 3 +++
>> =C2=A0 .../recipes-qt/qt5/qtwebkit/GraphicsSurfaceToken.h.patch=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 3 +++
>> =C2=A0 meta-arago-distro/recipes-qt/qt5/qtwebkit/WebCore.pri.patch=C2=A0=
=C2=A0=C2=A0 | 3 +++
>> =C2=A0 .../recipes-qt/qt5/qtwebkit/qttestbrowser.cpp.patch=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 3 +++
>> =C2=A0 .../0001-hostapd-change-conf-file-for-better-oob-startup.patch =
| 2 ++
>> =C2=A0 .../recipes-connectivity/vtun/vtun/08-gcc5-inline.patch=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 ++
>> =C2=A0 .../recipes-connectivity/vtun/vtun/Add_search_path.patch=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 3 +++
>> =C2=A0 .../recipes-connectivity/vtun/vtun/remove_strip.patch=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 3 +++
>> =C2=A0 .../wpa-supplicant/wpa-supplicant/crypto_openssl.patch=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 3 +++
>> =C2=A0 ...001-configure-Do-not-check-build-executable-extension.patch =
| 2 ++
>> =C2=A0 ...-Search-within-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-for-q.patch =
| 2 ++
>> =C2=A0 .../recipes-graphics/devil/files/Remove-ILUT-dependency.patch=C2=
=A0 | 2 ++
>> =C2=A0 ...-makefile.linux.def-relax-assignment-of-CC-and-other-.patch =
| 2 ++
>> =C2=A0 ...-Makefile-correct-use-of-CPP-CXX-and-other-standard-v.patch =
| 2 ++
>> =C2=A0 .../0001-configure.ac-stop-using-export-symbols-regex.patch=C2=A0=
=C2=A0=C2=A0 | 2 ++
>> =C2=A0 ...-gstducati-configure.ac-stop-using-export-symbols-reg.patch =
| 2 ++
>> =C2=A0 .../0001-configure.ac-stop-using-export-symbols-regex.patch=C2=A0=
=C2=A0=C2=A0 | 2 ++
>> =C2=A0 ...1-gstvpe-configure.ac-stop-using-export-symbols-regex.patch =
| 2 ++
>> =C2=A0 ...-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch =
| 2 ++
>> =C2=A0 .../0001-media-ctl-add-support-for-RGBIr-bayer-formats.patch=C2=
=A0=C2=A0 | 2 ++
>> =C2=A0 .../0001-v4l2-ctl-Add-routing-and-streams-support.patch=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 ++
>> =C2=A0 .../0002-media-ctl-add-support-for-routes-and-streams.patch=C2=A0=
=C2=A0=C2=A0 | 2 ++
>> =C2=A0 .../v4l-utils/0002-original-patch-mediactl-pkgconfig.patch=C2=A0=
=C2=A0=C2=A0=C2=A0 | 2 ++
>> =C2=A0 .../0003-original-patch-export-mediactl-headers.patch=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 ++
>> =C2=A0 ...-v4l2-ctl-compliance-add-routing-and-streams-multiple.patch =
| 2 ++
>> =C2=A0 ...-include-loki-SmallObj.h-ISO-C-17-does-not-allow-dyna.patch =
| 2 ++
>> =C2=A0 ...-include-loki-Threads.h-return-statement-with-a-value.patch =
| 2 ++
>> =C2=A0 ...-test-Function-FunctionTest.cpp-reference-to-bad_func.patch =
| 2 ++
>> =C2=A0 .../files/apply-modification-for-tflite-1.15-to-eigen.patch=C2=A0=
=C2=A0=C2=A0 | 3 +++
>> =C2=A0 .../netopeer2-server/0001-Add-EST-Yang-Models.patch=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 3 +++
>> =C2=A0 .../sysrepo-plugins-common/0001-so-version.patch=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 3=
 +++
>> =C2=A0 .../linalg/files/0001-Makefile-fix-toolchain-variables.patch=C2=
=A0=C2=A0 | 2 ++
>> =C2=A0 ...-Makefile-pass-PARALLEL_MAKE-variable-to-overwrite-j8.patch =
| 2 ++
>> =C2=A0 ...-float_compute-matmpy-Link-with-libdl-to-resolve-link.patch =
| 2 ++
>> =C2=A0 ...0001-Fix-paths-for-Yocto-build-and-add-RTOS-build-var.patch =
| 2 ++
>> =C2=A0 .../iperf/iperf-2.0.5/0001-fix-out-of-tree-config.patch=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 ++
>> =C2=A0 ...1-headers.h-remove-math.h-include-that-breaks-aarch64.patch =
| 2 ++
>> =C2=A0 .../iperf/iperf-2.0.5/0002-fix-bool-size-m4.patch=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 3 +++
>> =C2=A0 .../iperf/iperf-2.0.5/iperf-2.0.5_ManPage.patch=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
| 2 ++
>> =C2=A0 .../0001-autoconf-fix-for-cross-compilation-for-ARM.patch=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 2 ++
>> =C2=A0 ...1-Makefile.am-lblah-flags-belong-to-LDADD-not-LDFLAGS.patch =
| 2 ++
>> =C2=A0 53 files changed, 119 insertions(+)
>>
>> diff --git=20
>> a/meta-arago-distro/recipes-devtools/pm-qa/pm-qa/0001-Return-non-zero-=
value-on-test-failure.patch b/meta-arago-distro/recipes-devtools/pm-qa/pm=
-qa/0001-Return-non-zero-value-on-test-failure.patch
>> index a5b5b8cc..35dbe7f5 100644
>> ---=20
>> a/meta-arago-distro/recipes-devtools/pm-qa/pm-qa/0001-Return-non-zero-=
value-on-test-failure.patch
>> +++=20
>> b/meta-arago-distro/recipes-devtools/pm-qa/pm-qa/0001-Return-non-zero-=
value-on-test-failure.patch
>> @@ -4,6 +4,8 @@ Date: Thu, 13 Aug 2015 15:03:00 -0400
>> =C2=A0 By convention Linux tools return non-zero value on error/failur=
e.
>> +Upstream-Status: Inactive-Upstream
>> +
>> =C2=A0 Signed-off-by: Carlos Hernandez <ceh@ti.com>
>> =C2=A0 ---
>> =C2=A0=C2=A0 include/functions.sh | 1 +
>> diff --git=20
>> a/meta-arago-distro/recipes-devtools/pm-qa/pm-qa/0002-cpuidle-Avoid-re=
lative-paths.patch b/meta-arago-distro/recipes-devtools/pm-qa/pm-qa/0002-=
cpuidle-Avoid-relative-paths.patch
>> index 5252e3b1..0c39d6f4 100644
>> ---=20
>> a/meta-arago-distro/recipes-devtools/pm-qa/pm-qa/0002-cpuidle-Avoid-re=
lative-paths.patch
>> +++=20
>> b/meta-arago-distro/recipes-devtools/pm-qa/pm-qa/0002-cpuidle-Avoid-re=
lative-paths.patch
>> @@ -5,6 +5,8 @@ Date: Thu, 13 Aug 2015 15:03:01 -0400
>> =C2=A0 Instead of assuming location of files in the filesystem by usin=
g
>> =C2=A0 relative paths, call binary and let $PATH find binary location.
>> +Upstream-Status: Inactive-Upstream
>> +
>> =C2=A0 Signed-off-by: Carlos Hernandez <ceh@ti.com>
>> =C2=A0 ---
>> =C2=A0=C2=A0 cpuidle/cpuidle_02.sh | 2 +-
>> diff --git=20
>> a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/000=
1-layer-add-surfaces-Add-screenId-as-an-argument.patch b/meta-arago-distr=
o/recipes-graphics/wayland/wayland-ivi-extension/0001-layer-add-surfaces-=
Add-screenId-as-an-argument.patch
>> index b8afc0de..b8601e36 100644
>> ---=20
>> a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/000=
1-layer-add-surfaces-Add-screenId-as-an-argument.patch
>> +++=20
>> b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/000=
1-layer-add-surfaces-Add-screenId-as-an-argument.patch
>> @@ -7,6 +7,8 @@ Add Screen_ID as a argument to handle multiple screens.
>> =C2=A0 Removed choose_screen function as it is redundant
>> =C2=A0 after this change
>> +Upstream-Status: Inappropriate [arago specific]
>> +
>> =C2=A0 Signed-off-by: Ramprasad N <x0038811@ti.com>
>> =C2=A0 Reviewed-by: Karthik Ramanan <a0393906@ti.com>
>> =C2=A0 ---
>> diff --git=20
>> a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/000=
2-layer-add-surfaces-surface-layer-management.patch b/meta-arago-distro/r=
ecipes-graphics/wayland/wayland-ivi-extension/0002-layer-add-surfaces-sur=
face-layer-management.patch
>> index eff4a79c..adf6711f 100644
>> ---=20
>> a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/000=
2-layer-add-surfaces-surface-layer-management.patch
>> +++=20
>> b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/000=
2-layer-add-surfaces-surface-layer-management.patch
>> @@ -6,6 +6,8 @@ Subject: [PATCH 2/2] layer-add-surfaces: surface-layer=
=20
>> management
>> =C2=A0 This patch prevents surfaces from getting added to a new layer
>> =C2=A0 if they are already registered to an existing layer.
>> +Upstream-Status: Inappropriate [arago specific]
>> +
>> =C2=A0 Signed-off-by: Ramprasad N <x0038811@ti.com>
>> =C2=A0 Reviewed-by: Karthik Ramanan <a0393906@ti.com>
>> =C2=A0 ---
>> diff --git=20
>> a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/for=
ce-type-conversion.patch b/meta-arago-distro/recipes-graphics/wayland/way=
land-ivi-extension/force-type-conversion.patch
>> index a72aeedf..acebcfe4 100644
>> ---=20
>> a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/for=
ce-type-conversion.patch
>> +++=20
>> b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/for=
ce-type-conversion.patch
>> @@ -1,3 +1,6 @@
>> +
>> +Upstream-Status: Inappropriate [arago specific]
>> +
>> =C2=A0 diff --git=20
>> a/ivi-layermanagement-examples/EGLWLMockNavigation/src/OpenGLES2App.cp=
p b/ivi-layermanagement-examples/EGLWLMockNavigation/src/OpenGLES2App.cpp
>> =C2=A0 index 2e65864..e14dbc0 100644
>> =C2=A0 ---=20
>> a/ivi-layermanagement-examples/EGLWLMockNavigation/src/OpenGLES2App.cp=
p
>> diff --git=20
>> a/meta-arago-distro/recipes-qt/qt5/qtbase/0001-calculator-Add-exit-but=
ton-for-non-window-environmen.patch b/meta-arago-distro/recipes-qt/qt5/qt=
base/0001-calculator-Add-exit-button-for-non-window-environmen.patch
>> index e123df57..11112878 100644
>> ---=20
>> a/meta-arago-distro/recipes-qt/qt5/qtbase/0001-calculator-Add-exit-but=
ton-for-non-window-environmen.patch
>> +++=20
>> b/meta-arago-distro/recipes-qt/qt5/qtbase/0001-calculator-Add-exit-but=
ton-for-non-window-environmen.patch
>> @@ -3,6 +3,8 @@ From: Jake Stiffler <jake@mcsdk-hpc-test.(none)>
>> =C2=A0 Date: Thu, 19 Mar 2015 15:21:08 -0400
>> =C2=A0 Subject: [PATCH 1/2] calculator: Add exit button for non-window=
=20
>> environment.
>> +Upstream-Status: Inappropriate [arago specific]
>> +
>> =C2=A0 Signed-off-by: Jake Stiffler <jake@mcsdk-hpc-test.(none)>
>> =C2=A0 ---
>> =C2=A0=C2=A0 examples/widgets/widgets/calculator/calculator.cpp |=C2=A0=
=C2=A0=C2=A0 9 ++++++++-
>> diff --git=20
>> a/meta-arago-distro/recipes-qt/qt5/qtbase/0001-deform-Fix-how-controls=
-are-shown.patch b/meta-arago-distro/recipes-qt/qt5/qtbase/0001-deform-Fi=
x-how-controls-are-shown.patch
>> index 076becaa..7f1e0570 100644
>> ---=20
>> a/meta-arago-distro/recipes-qt/qt5/qtbase/0001-deform-Fix-how-controls=
-are-shown.patch
>> +++=20
>> b/meta-arago-distro/recipes-qt/qt5/qtbase/0001-deform-Fix-how-controls=
-are-shown.patch
>> @@ -8,6 +8,8 @@ Subject: [PATCH 1/2] deform: Fix how controls are show=
n.
>> =C2=A0 * If controls are not full screen, then they must retain focus =
while
>> =C2=A0=C2=A0=C2=A0 opened.
>> +Upstream-Status: Pending
>> +
>> =C2=A0 Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
>> =C2=A0 ---
>> =C2=A0=C2=A0 examples/widgets/painting/deform/pathdeform.cpp |=C2=A0=C2=
=A0=C2=A0 4 +++-
>> diff --git=20
>> a/meta-arago-distro/recipes-qt/qt5/qtbase/0002-animatedtiles-Add-exit-=
button-for-non-window-environ.patch b/meta-arago-distro/recipes-qt/qt5/qt=
base/0002-animatedtiles-Add-exit-button-for-non-window-environ.patch
>> index 7b7ab3c2..c1452eda 100644
>> ---=20
>> a/meta-arago-distro/recipes-qt/qt5/qtbase/0002-animatedtiles-Add-exit-=
button-for-non-window-environ.patch
>> +++=20
>> b/meta-arago-distro/recipes-qt/qt5/qtbase/0002-animatedtiles-Add-exit-=
button-for-non-window-environ.patch
>> @@ -4,6 +4,8 @@ Date: Fri, 20 Mar 2015 15:00:51 -0400
>> =C2=A0 Subject: [PATCH 2/2] animatedtiles: Add exit button for non-win=
dow
>> =C2=A0=C2=A0 environment.
>> +Upstream-Status: Inappropriate [arago specific]
>> +
>> =C2=A0 Signed-off-by: Jake Stiffler <jake@mcsdk-hpc-test.(none)>
>> =C2=A0 ---
>> =C2=A0=C2=A0 .../animation/animatedtiles/animatedtiles.qrc=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 1 +
>> diff --git=20
>> a/meta-arago-distro/recipes-qt/qt5/qtbase/0002-deform-disable-opengl-b=
utton.patch b/meta-arago-distro/recipes-qt/qt5/qtbase/0002-deform-disable=
-opengl-button.patch
>> index b15324bf..31e573d5 100644
>> ---=20
>> a/meta-arago-distro/recipes-qt/qt5/qtbase/0002-deform-disable-opengl-b=
utton.patch
>> +++=20
>> b/meta-arago-distro/recipes-qt/qt5/qtbase/0002-deform-disable-opengl-b=
utton.patch
>> @@ -3,6 +3,8 @@ From: Jacob Stiffler <j-stiffler@ti.com>
>> =C2=A0 Date: Fri, 12 Jun 2015 10:24:33 -0400
>> =C2=A0 Subject: [PATCH 2/2] deform: disable opengl button.
>> +Upstream-Status: Inappropriate [arago specific]
>> +
>> =C2=A0 Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
>> =C2=A0 ---
>> =C2=A0=C2=A0 examples/widgets/painting/deform/pathdeform.cpp |=C2=A0=C2=
=A0 12 ++++++------
>> diff --git=20
>> a/meta-arago-distro/recipes-qt/qt5/qtdeclarative/0001-touchinteraction=
.qml-Add-exit-button.patch b/meta-arago-distro/recipes-qt/qt5/qtdeclarati=
ve/0001-touchinteraction.qml-Add-exit-button.patch
>> index c7ae8d1d..8ff24601 100644
>> ---=20
>> a/meta-arago-distro/recipes-qt/qt5/qtdeclarative/0001-touchinteraction=
.qml-Add-exit-button.patch
>> +++=20
>> b/meta-arago-distro/recipes-qt/qt5/qtdeclarative/0001-touchinteraction=
.qml-Add-exit-button.patch
>> @@ -3,6 +3,8 @@ From: Eric Ruei <e-ruei1@ti.com>
>> =C2=A0 Date: Tue, 16 Aug 2016 15:09:04 -0400
>> =C2=A0 Subject: [PATCH] touchinteraction.qml: Add "exit" button
>> +Upstream-Status: Inappropriate [arago specific]
>> +
>> =C2=A0 Signed-off-by: Eric Ruei <e-ruei1@ti.com>
>> =C2=A0 ---
>> =C2=A0=C2=A0 .../quick/touchinteraction/touchinteraction.qml=C2=A0=C2=A0=
=C2=A0 | 38=20
>> ++++++++++++++++++++++
>> diff --git=20
>> a/meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-Target.pri-update-to-=
use-GL_NoX-version-of-GraphicsS.patch b/meta-arago-distro/recipes-qt/qt5/=
qtwebkit/0001-Target.pri-update-to-use-GL_NoX-version-of-GraphicsS.patch
>> index 55a4c032..5ccf6df3 100644
>> ---=20
>> a/meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-Target.pri-update-to-=
use-GL_NoX-version-of-GraphicsS.patch
>> +++=20
>> b/meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-Target.pri-update-to-=
use-GL_NoX-version-of-GraphicsS.patch
>> @@ -4,6 +4,8 @@ Date: Thu, 17 Jul 2014 16:11:46 -0400
>> =C2=A0 Subject: [PATCH] Target.pri: update to use GL_NoX version of=20
>> GraphicsSurface
>> =C2=A0=C2=A0 sources
>> +Upstream-Status: Inappropriate [arago specific]
>> +
>> =C2=A0 Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>> =C2=A0 ---
>> =C2=A0=C2=A0 Source/WebCore/Target.pri | 4 ++++
>> diff --git=20
>> a/meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsContext3DQt.cpp.pa=
tch b/meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsContext3DQt.cpp.p=
atch
>> index aa752bb8..7a7cf752 100644
>> ---=20
>> a/meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsContext3DQt.cpp.pa=
tch
>> +++=20
>> b/meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsContext3DQt.cpp.pa=
tch
>> @@ -1,3 +1,6 @@
>> +
>> +Upstream-Status: Inappropriate [arago specific]
>> +
>> =C2=A0 ---=20
>> qtwebkit/Source/WebCore/platform/graphics/qt/GraphicsContext3DQt.cpp.o=
rig=C2=A0=C2=A0=C2=A0 2013-09-07 13:41:19.946858466 +0530
>> =C2=A0 +++=20
>> qtwebkit/Source/WebCore/platform/graphics/qt/GraphicsContext3DQt.cpp=C2=
=A0=C2=A0=C2=A0 2013-09-07 17:48:13.958979770 +0530
>> =C2=A0 @@ -383,21 +383,23 @@ GraphicsContext3D::GraphicsContext3D(Gra
>> diff --git=20
>> a/meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsSurfaceGL_NoX.cpp.=
patch b/meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsSurfaceGL_NoX.c=
pp.patch
>> index 89712a8b..033fa893 100644
>> ---=20
>> a/meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsSurfaceGL_NoX.cpp.=
patch
>> +++=20
>> b/meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsSurfaceGL_NoX.cpp.=
patch
>> @@ -1,3 +1,6 @@
>> +
>> +Upstream-Status: Inappropriate [arago specific]
>> +
>> =C2=A0 diff -Nurp8=20
>> Source/WebCore/platform/graphics/surfaces/qt/GraphicsSurfaceGL_NoX.cpp=
=20
>> Source-new/WebCore/platform/graphics/surfaces/qt/GraphicsSurfaceGL_NoX=
.cpp
>> =C2=A0 ---=20
>> qtwebkit/Source/WebCore/platform/graphics/surfaces/qt/GraphicsSurfaceG=
L_NoX.cpp=C2=A0=C2=A0=C2=A0 1970-01-01 05:30:00.000000000 +0530
>> =C2=A0 +++=20
>> qtwebkit-new/Source/WebCore/platform/graphics/surfaces/qt/GraphicsSurf=
aceGL_NoX.cpp=C2=A0=C2=A0=C2=A0 2013-09-07 13:43:55.186851650 +0530
>> diff --git=20
>> a/meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsSurfaceToken.h.pat=
ch b/meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsSurfaceToken.h.pat=
ch
>> index 722df392..719793fd 100644
>> ---=20
>> a/meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsSurfaceToken.h.pat=
ch
>> +++=20
>> b/meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsSurfaceToken.h.pat=
ch
>> @@ -1,3 +1,6 @@
>> +
>> +Upstream-Status: Inappropriate [arago specific]
>> +
>> =C2=A0 ---=20
>> qtwebkit/Source/WebCore/platform/graphics/surfaces/GraphicsSurfaceToke=
n.h.orig=C2=A0=C2=A0=C2=A0 2013-09-07 13:44:47.906849335 +0530
>> =C2=A0 +++=20
>> qtwebkit/Source/WebCore/platform/graphics/surfaces/GraphicsSurfaceToke=
n.h=C2=A0=C2=A0=C2=A0 2013-09-07 13:46:12.554845618 +0530
>> =C2=A0 @@ -50,17 +50,30 @@ struct GraphicsSurfaceToken {
>> diff --git=20
>> a/meta-arago-distro/recipes-qt/qt5/qtwebkit/WebCore.pri.patch=20
>> b/meta-arago-distro/recipes-qt/qt5/qtwebkit/WebCore.pri.patch
>> index 276b3cf8..cc2bf510 100644
>> --- a/meta-arago-distro/recipes-qt/qt5/qtwebkit/WebCore.pri.patch
>> +++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit/WebCore.pri.patch
>> @@ -1,3 +1,6 @@
>> +
>> +Upstream-Status: Inappropriate [arago specific]
>> +
>> =C2=A0 diff --git a/Source/WebCore/WebCore.pri b/Source/WebCore/WebCor=
e.pri
>> =C2=A0 index 0189394..00f7090 100644
>> =C2=A0 --- a/Source/WebCore/WebCore.pri
>> diff --git=20
>> a/meta-arago-distro/recipes-qt/qt5/qtwebkit/qttestbrowser.cpp.patch=20
>> b/meta-arago-distro/recipes-qt/qt5/qtwebkit/qttestbrowser.cpp.patch
>> index 9a57be22..badf9349 100644
>> --- a/meta-arago-distro/recipes-qt/qt5/qtwebkit/qttestbrowser.cpp.patc=
h
>> +++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit/qttestbrowser.cpp.patc=
h
>> @@ -1,3 +1,6 @@
>> +
>> +Upstream-Status: Inappropriate [arago specific]
>> +
>> =C2=A0 --- qtwebkit/Tools/QtTestBrowser/qttestbrowser.cpp.orig   =20
>> 2013-09-08 17:28:48.633593482 +0530
>> =C2=A0 +++ qtwebkit/Tools/QtTestBrowser/qttestbrowser.cpp=C2=A0=C2=A0=C2=
=A0 2013-09-08=20
>> 17:29:07.713592964 +0530
>> =C2=A0 @@ -235,19 +235,20 @@ void LauncherApplication::handleUserOpti
>> diff --git=20
>> a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx/0=
001-hostapd-change-conf-file-for-better-oob-startup.patch b/meta-arago-ex=
tras/recipes-connectivity/hostap/hostap-daemon-wl18xx/0001-hostapd-change=
-conf-file-for-better-oob-startup.patch
>> index c89dd4c8..1b1f59a1 100644
>> ---=20
>> a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx/0=
001-hostapd-change-conf-file-for-better-oob-startup.patch
>> +++=20
>> b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx/0=
001-hostapd-change-conf-file-for-better-oob-startup.patch
>> @@ -5,6 +5,8 @@ Subject: [PATCH] hostapd change conf file for better=20
>> oob startup
>> =C2=A0 Changed some of the default parameters
>> +Upstream-Status: Inappropriate [configuration change]
>> +
>> =C2=A0 Signed-off-by: Yaniv Mahani <yanivma@ti.com>
>> =C2=A0 ---
>> =C2=A0=C2=A0 hostapd/hostapd.conf |=C2=A0 724=20
>> ++++++--------------------------------------------
>> diff --git=20
>> a/meta-arago-extras/recipes-connectivity/vtun/vtun/08-gcc5-inline.patc=
h b/meta-arago-extras/recipes-connectivity/vtun/vtun/08-gcc5-inline.patch
>> index c9a00900..18497111 100644
>> ---=20
>> a/meta-arago-extras/recipes-connectivity/vtun/vtun/08-gcc5-inline.patc=
h
>> +++=20
>> b/meta-arago-extras/recipes-connectivity/vtun/vtun/08-gcc5-inline.patc=
h
>> @@ -7,6 +7,8 @@ Author: "Potter, Tim (Cloud Services)"=20
>> <timothy.potter@hp.com>
>> =C2=A0 Reviewed-by: gregor herrmann <gregoa@debian.org>
>> =C2=A0 Last-Update: 2015-07-23
>> +Upstream-Status: Pending
>> +
>> =C2=A0 --- a/cfg_file.y
>> =C2=A0 +++ b/cfg_file.y
>> =C2=A0 @@ -624,7 +624,7 @@
>> diff --git=20
>> a/meta-arago-extras/recipes-connectivity/vtun/vtun/Add_search_path.pat=
ch b/meta-arago-extras/recipes-connectivity/vtun/vtun/Add_search_path.pat=
ch
>> index ebf83310..30808ae3 100644
>> ---=20
>> a/meta-arago-extras/recipes-connectivity/vtun/vtun/Add_search_path.pat=
ch
>> +++=20
>> b/meta-arago-extras/recipes-connectivity/vtun/vtun/Add_search_path.pat=
ch
>> @@ -1,3 +1,6 @@
>> +
>> +Upstream-Status: Inappropriate [arago specific]
>> +
>> =C2=A0 --- vtun-3.0.3/configure.orig
>> =C2=A0 +++ vtun-3.0.3/configure
>> =C2=A0 @@ -5680,7 +5680,7 @@
>> diff --git=20
>> a/meta-arago-extras/recipes-connectivity/vtun/vtun/remove_strip.patch=20
>> b/meta-arago-extras/recipes-connectivity/vtun/vtun/remove_strip.patch
>> index 4e123931..86643877 100644
>> --- a/meta-arago-extras/recipes-connectivity/vtun/vtun/remove_strip.pa=
tch
>> +++ b/meta-arago-extras/recipes-connectivity/vtun/vtun/remove_strip.pa=
tch
>> @@ -1,3 +1,6 @@
>> +
>> +Upstream-Status: Inappropriate [arago specific]
>> +
>> =C2=A0 --- vtun-3.0.3/Makefile.orig.in
>> =C2=A0 +++ vtun-3.0.3/Makefile.in
>> =C2=A0 @@ -99,6 +99,5 @@
>> diff --git=20
>> a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant=
/crypto_openssl.patch b/meta-arago-extras/recipes-connectivity/wpa-suppli=
cant/wpa-supplicant/crypto_openssl.patch
>> index 650f5c19..c958f403 100644
>> ---=20
>> a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant=
/crypto_openssl.patch
>> +++=20
>> b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant=
/crypto_openssl.patch
>> @@ -1,3 +1,6 @@
>> +
>> +Upstream-Status: Inappropriate [arago specific]
>> +
>> =C2=A0 --- a/src/crypto/crypto_openssl.c=C2=A0=C2=A0=C2=A0 2019-11-09 =
06:46:42.112779317=20
>> -0600
>> =C2=A0 +++ b/src/crypto/crypto_openssl.c.new=C2=A0=C2=A0=C2=A0 2019-11=
-09=20
>> 13:16:57.560629882 -0600
>> =C2=A0 @@ -602,11 +602,15 @@
>> diff --git=20
>> a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6/0001-configure-Do-not=
-check-build-executable-extension.patch b/meta-arago-extras/recipes-core/=
llvm/ti-llvm3.6/0001-configure-Do-not-check-build-executable-extension.pa=
tch
>> index 9a60caf3..e9c332ac 100644
>> ---=20
>> a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6/0001-configure-Do-not=
-check-build-executable-extension.patch
>> +++=20
>> b/meta-arago-extras/recipes-core/llvm/ti-llvm3.6/0001-configure-Do-not=
-check-build-executable-extension.patch
>> @@ -6,6 +6,8 @@ Subject: [PATCH] configure: Do not check build=20
>> executable extension.
>> =C2=A0=C2=A0 * This seems to cause issues nativesdk and build sdk
>> =C2=A0=C2=A0=C2=A0=C2=A0 architectures are the same.
>> +Upstream-Status: Inappropriate [oe specific]
>> +
>> =C2=A0 Signed-off-by: Jake Stiffler <j-stiffler@ti.com>
>> =C2=A0 ---
>> =C2=A0=C2=A0 configure=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 3 ++=
+
>> diff --git=20
>> a/meta-arago-extras/recipes-devtools/cmake/extra-cmake-modules/0001-Se=
arch-within-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-for-q.patch b/meta-arago-ext=
ras/recipes-devtools/cmake/extra-cmake-modules/0001-Search-within-OE_QMAK=
E_PATH_EXTERNAL_HOST_BINS-for-q.patch
>> index 964dbbf9..a8c2132e 100644
>> ---=20
>> a/meta-arago-extras/recipes-devtools/cmake/extra-cmake-modules/0001-Se=
arch-within-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-for-q.patch
>> +++=20
>> b/meta-arago-extras/recipes-devtools/cmake/extra-cmake-modules/0001-Se=
arch-within-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-for-q.patch
>> @@ -4,6 +4,8 @@ Date: Mon, 29 Dec 2014 12:05:20 +0100
>> =C2=A0 Subject: [PATCH] Search within OE_QMAKE_PATH_EXTERNAL_HOST_BINS=
 for
>> =C2=A0=C2=A0 qtwaylandscanner
>> +Upstream-Status: Inappropriate [oe specific]
>> +
>> =C2=A0 Signed-off-by: Simon Busch <morphis@gravedo.de>
>> =C2=A0 ---
>> =C2=A0=C2=A0 find-modules/FindQtWaylandScanner.cmake | 2 +-
>> diff --git=20
>> a/meta-arago-extras/recipes-graphics/devil/files/Remove-ILUT-dependenc=
y.patch b/meta-arago-extras/recipes-graphics/devil/files/Remove-ILUT-depe=
ndency.patch
>> index 4f0f9dfa..0dcc9263 100644
>> ---=20
>> a/meta-arago-extras/recipes-graphics/devil/files/Remove-ILUT-dependenc=
y.patch
>> +++=20
>> b/meta-arago-extras/recipes-graphics/devil/files/Remove-ILUT-dependenc=
y.patch
>> @@ -1,3 +1,5 @@
>> +Upstream-Status: Inappropriate [arago specific]
>> +
>> =C2=A0 diff --git a/DevIL/CMakeLists.txt b/DevIL/CMakeLists.txt
>> =C2=A0 index e342f93d..fae40167 100644
>> =C2=A0 --- a/DevIL/CMakeLists.txt
>> diff --git=20
>> a/meta-arago-extras/recipes-graphics/ti-gc320-tests/files/0001-makefil=
e.linux.def-relax-assignment-of-CC-and-other-.patch b/meta-arago-extras/r=
ecipes-graphics/ti-gc320-tests/files/0001-makefile.linux.def-relax-assign=
ment-of-CC-and-other-.patch
>> index 0078a296..0ae5ff65 100644
>> ---=20
>> a/meta-arago-extras/recipes-graphics/ti-gc320-tests/files/0001-makefil=
e.linux.def-relax-assignment-of-CC-and-other-.patch
>> +++=20
>> b/meta-arago-extras/recipes-graphics/ti-gc320-tests/files/0001-makefil=
e.linux.def-relax-assignment-of-CC-and-other-.patch
>> @@ -3,6 +3,8 @@ From: Denys Dmytriyenko <denys@ti.com>
>> =C2=A0 Date: Sun, 26 Mar 2017 14:14:49 -0400
>> =C2=A0 Subject: [PATCH] makefile.linux.def: relax assignment of CC and=
=20
>> other tools
>> +Upstream-Status: Inappropriate [oe specific]
>> +
>> =C2=A0 Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>> =C2=A0 ---
>> =C2=A0=C2=A0 tests/src/makefile.linux.def | 14 +++++++-------
>> diff --git=20
>> a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plu=
gins-dsp66/0001-Makefile-correct-use-of-CPP-CXX-and-other-standard-v.patc=
h b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plug=
ins-dsp66/0001-Makefile-correct-use-of-CPP-CXX-and-other-standard-v.patch
>> index 3c913ed4..8048de93 100644
>> ---=20
>> a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plu=
gins-dsp66/0001-Makefile-correct-use-of-CPP-CXX-and-other-standard-v.patc=
h
>> +++=20
>> b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plu=
gins-dsp66/0001-Makefile-correct-use-of-CPP-CXX-and-other-standard-v.patc=
h
>> @@ -3,6 +3,8 @@ From: Denys Dmytriyenko <denys@ti.com>
>> =C2=A0 Date: Sun, 26 Mar 2017 15:12:44 -0400
>> =C2=A0 Subject: [PATCH] Makefile: correct use of CPP/CXX and other sta=
ndard=20
>> variables
>> +Upstream-Status: Inappropriate [oe specific]
>> +
>> =C2=A0 Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>> =C2=A0 ---
>> =C2=A0=C2=A0 src/kernels/make.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 16 +++++++---------
>> diff --git=20
>> a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plu=
gins-dsp66/0001-configure.ac-stop-using-export-symbols-regex.patch b/meta=
-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-dsp6=
6/0001-configure.ac-stop-using-export-symbols-regex.patch
>> index c9721b70..e3df61ac 100644
>> ---=20
>> a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plu=
gins-dsp66/0001-configure.ac-stop-using-export-symbols-regex.patch
>> +++=20
>> b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plu=
gins-dsp66/0001-configure.ac-stop-using-export-symbols-regex.patch
>> @@ -7,6 +7,8 @@ The old regex is no longer correct for GStreamer 1.14.
>>  =20
>> Bug-Debian:https://urldefense.com/v3/__https://bugs.debian.org/894642_=
_;!!G3vK!U9hQUOynrU7Ehw3k-U0BB1YB00PTTyPow1EJYYHSh6LI_KH7dBjbeODabitL5qA1=
GWPDbUfOO4ZoxoGOzLszfxPXYYg_4NVf9g$
>> +Upstream-Status: Inappropriate [arago specific]
>> +
>> =C2=A0 Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>> =C2=A0 ---
>> =C2=A0=C2=A0 configure.ac | 2 +-
>> diff --git=20
>> a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plu=
gins-ducati/0001-gstducati-configure.ac-stop-using-export-symbols-reg.pat=
ch b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plu=
gins-ducati/0001-gstducati-configure.ac-stop-using-export-symbols-reg.pat=
ch
>> index 4104e24e..c6a24c06 100644
>> ---=20
>> a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plu=
gins-ducati/0001-gstducati-configure.ac-stop-using-export-symbols-reg.pat=
ch
>> +++=20
>> b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plu=
gins-ducati/0001-gstducati-configure.ac-stop-using-export-symbols-reg.pat=
ch
>> @@ -5,6 +5,8 @@ Subject: [PATCH] gstducati: configure.ac stop using=20
>> -export-symbols-regex
>> =C2=A0 The old regex is no longer correct for GStreamer 1.14.
>> +Upstream-Status: Inappropriate [arago specific]
>> +
>> =C2=A0 Signed-off-by: Ramprasad N <x0038811@ti.com>
>> =C2=A0 ---
>> =C2=A0=C2=A0 configure.ac | 2 +-
>> diff --git=20
>> a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plu=
gins-hevc/0001-configure.ac-stop-using-export-symbols-regex.patch b/meta-=
arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc/=
0001-configure.ac-stop-using-export-symbols-regex.patch
>> index c9721b70..e3df61ac 100644
>> ---=20
>> a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plu=
gins-hevc/0001-configure.ac-stop-using-export-symbols-regex.patch
>> +++=20
>> b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plu=
gins-hevc/0001-configure.ac-stop-using-export-symbols-regex.patch
>> @@ -7,6 +7,8 @@ The old regex is no longer correct for GStreamer 1.14.
>>  =20
>> Bug-Debian:https://urldefense.com/v3/__https://bugs.debian.org/894642_=
_;!!G3vK!U9hQUOynrU7Ehw3k-U0BB1YB00PTTyPow1EJYYHSh6LI_KH7dBjbeODabitL5qA1=
GWPDbUfOO4ZoxoGOzLszfxPXYYg_4NVf9g$
>> +Upstream-Status: Inappropriate [arago specific]
>> +
>> =C2=A0 Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>> =C2=A0 ---
>> =C2=A0=C2=A0 configure.ac | 2 +-
>> diff --git=20
>> a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plu=
gins-vpe/0001-gstvpe-configure.ac-stop-using-export-symbols-regex.patch b=
/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins=
-vpe/0001-gstvpe-configure.ac-stop-using-export-symbols-regex.patch
>> index d68c152b..d1739df8 100644
>> ---=20
>> a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plu=
gins-vpe/0001-gstvpe-configure.ac-stop-using-export-symbols-regex.patch
>> +++=20
>> b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plu=
gins-vpe/0001-gstvpe-configure.ac-stop-using-export-symbols-regex.patch
>> @@ -12,6 +12,8 @@ undefined symbol as --export-symbols option is no=20
>> more supported.
>> =C2=A0 Rename PACKAGE to vpe to get the expected symbol
>> =C2=A0 gst_plugin_vpe_get_desc
>> +Upstream-Status: Inappropriate [arago specific]
>> +
>> =C2=A0 Signed-off-by: Ramprasad N <x0038811@ti.com>
>> =C2=A0 ---
>> =C2=A0=C2=A0 configure.ac | 2 +-
>> diff --git=20
>> a/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0001-Revert=
-media-ctl-Don-t-install-libmediactl-and-libv4.patch b/meta-arago-extras/=
recipes-multimedia/v4l-utils/v4l-utils/0001-Revert-media-ctl-Don-t-instal=
l-libmediactl-and-libv4.patch
>> index 7305e471..2b5eef11 100644
>> ---=20
>> a/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0001-Revert=
-media-ctl-Don-t-install-libmediactl-and-libv4.patch
>> +++=20
>> b/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0001-Revert=
-media-ctl-Don-t-install-libmediactl-and-libv4.patch
>> @@ -7,6 +7,8 @@ Subject: [PATCH] Revert "media-ctl: Don't install=20
>> libmediactl and
>> =C2=A0 This reverts commit 0911dce53b08b0df3066be2c75f67e8a314d8729.
>> +Upstream-Status: Pending
>> +
>> =C2=A0 Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> =C2=A0 Conflicts:
>> diff --git=20
>> a/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0001-media-=
ctl-add-support-for-RGBIr-bayer-formats.patch b/meta-arago-extras/recipes=
-multimedia/v4l-utils/v4l-utils/0001-media-ctl-add-support-for-RGBIr-baye=
r-formats.patch
>> index 1dff0637..cf391bf5 100644
>> ---=20
>> a/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0001-media-=
ctl-add-support-for-RGBIr-bayer-formats.patch
>> +++=20
>> b/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0001-media-=
ctl-add-support-for-RGBIr-bayer-formats.patch
>> @@ -3,6 +3,8 @@ From: Jai Luthra <j-luthra@ti.com>
>> =C2=A0 Date: Tue, 5 Jul 2022 16:23:39 +0530
>> =C2=A0 Subject: [PATCH] media-ctl: add support for RGBIr bayer formats
>> +Upstream-Status: Pending
>> +
>> =C2=A0 Signed-off-by: Jai Luthra <j-luthra@ti.com>
>> =C2=A0 ---
>> =C2=A0=C2=A0 include/linux/media-bus-format.h | 10 +++++++++-
>> diff --git=20
>> a/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0001-v4l2-c=
tl-Add-routing-and-streams-support.patch b/meta-arago-extras/recipes-mult=
imedia/v4l-utils/v4l-utils/0001-v4l2-ctl-Add-routing-and-streams-support.=
patch
>> index 9fd19edc..57fb630d 100644
>> ---=20
>> a/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0001-v4l2-c=
tl-Add-routing-and-streams-support.patch
>> +++=20
>> b/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0001-v4l2-c=
tl-Add-routing-and-streams-support.patch
>> @@ -12,6 +12,8 @@ configurations per stream.
>> =C2=A0 Based on work from Jacopo Mondi <jacopo@jmondi.org> and
>> =C2=A0 Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>.
>> +Upstream-Status: Pending
>> +
>> =C2=A0 Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> =C2=A0 ---
>> =C2=A0=C2=A0 utils/v4l2-ctl/v4l2-ctl-subdev.cpp | 288 ++++++++++++++++=
+++++++++----
>> diff --git=20
>> a/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0002-media-=
ctl-add-support-for-routes-and-streams.patch b/meta-arago-extras/recipes-=
multimedia/v4l-utils/v4l-utils/0002-media-ctl-add-support-for-routes-and-=
streams.patch
>> index 79864f01..5dc06ac0 100644
>> ---=20
>> a/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0002-media-=
ctl-add-support-for-routes-and-streams.patch
>> +++=20
>> b/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0002-media-=
ctl-add-support-for-routes-and-streams.patch
>> @@ -8,6 +8,8 @@ configurations per stream.
>> =C2=A0 Based on work from Sakari Ailus <sakari.ailus@linux.intel.com>.
>> +Upstream-Status: Pending
>> +
>> =C2=A0 Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> =C2=A0 ---
>> =C2=A0=C2=A0 utils/media-ctl/libmediactl.c=C2=A0=C2=A0 |=C2=A0 41 ++++=
+
>> diff --git=20
>> a/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0002-origin=
al-patch-mediactl-pkgconfig.patch b/meta-arago-extras/recipes-multimedia/=
v4l-utils/v4l-utils/0002-original-patch-mediactl-pkgconfig.patch
>> index 6ad9f2c1..e33b63d1 100644
>> ---=20
>> a/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0002-origin=
al-patch-mediactl-pkgconfig.patch
>> +++=20
>> b/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0002-origin=
al-patch-mediactl-pkgconfig.patch
>> @@ -3,6 +3,8 @@ From: Khem Raj <raj.khem@gmail.com>
>> =C2=A0 Date: Sun, 1 Mar 2015 22:25:07 +0000
>> =C2=A0 Subject: [PATCH] %% original patch: mediactl-pkgconfig.patch
>> +Upstream-Status: Pending
>> +
>> =C2=A0 ---
>> =C2=A0=C2=A0 utils/media-ctl/Makefile.am | 1 +
>> =C2=A0=C2=A0 1 file changed, 1 insertion(+)
>> diff --git=20
>> a/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0003-origin=
al-patch-export-mediactl-headers.patch b/meta-arago-extras/recipes-multim=
edia/v4l-utils/v4l-utils/0003-original-patch-export-mediactl-headers.patc=
h
>> index 5562d2c1..7b599b9d 100644
>> ---=20
>> a/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0003-origin=
al-patch-export-mediactl-headers.patch
>> +++=20
>> b/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0003-origin=
al-patch-export-mediactl-headers.patch
>> @@ -3,6 +3,8 @@ From: Khem Raj <raj.khem@gmail.com>
>> =C2=A0 Date: Sun, 1 Mar 2015 22:25:07 +0000
>> =C2=A0 Subject: [PATCH] %% original patch: export-mediactl-headers.pat=
ch
>> +Upstream-Status: Inappropriate [arago specific]
>> +
>> =C2=A0 ---
>> =C2=A0=C2=A0 utils/media-ctl/Makefile.am | 4 ++--
>> =C2=A0=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)
>> diff --git=20
>> a/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0003-v4l2-c=
tl-compliance-add-routing-and-streams-multiple.patch b/meta-arago-extras/=
recipes-multimedia/v4l-utils/v4l-utils/0003-v4l2-ctl-compliance-add-routi=
ng-and-streams-multiple.patch
>> index aeb97e09..a9a3afce 100644
>> ---=20
>> a/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0003-v4l2-c=
tl-compliance-add-routing-and-streams-multiple.patch
>> +++=20
>> b/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0003-v4l2-c=
tl-compliance-add-routing-and-streams-multiple.patch
>> @@ -6,6 +6,8 @@ Subject: [PATCH 3/3] v4l2-ctl/compliance: add routing=20
>> and streams multiplexed
>> =C2=A0 Add basic support for routing and streams.
>> +Upstream-Status: Pending
>> +
>> =C2=A0 Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> =C2=A0 ---
>> =C2=A0=C2=A0 utils/v4l2-compliance/v4l2-compliance.cpp=C2=A0=C2=A0 | 1=
20 ++++++++++++++++----
>> diff --git=20
>> a/meta-arago-extras/recipes-support/loki/libloki/0001-include-loki-Sma=
llObj.h-ISO-C-17-does-not-allow-dyna.patch b/meta-arago-extras/recipes-su=
pport/loki/libloki/0001-include-loki-SmallObj.h-ISO-C-17-does-not-allow-d=
yna.patch
>> index acd94d13..cabde7dd 100644
>> ---=20
>> a/meta-arago-extras/recipes-support/loki/libloki/0001-include-loki-Sma=
llObj.h-ISO-C-17-does-not-allow-dyna.patch
>> +++=20
>> b/meta-arago-extras/recipes-support/loki/libloki/0001-include-loki-Sma=
llObj.h-ISO-C-17-does-not-allow-dyna.patch
>> @@ -4,6 +4,8 @@ Date: Mon, 13 Feb 2023 13:11:16 -0600
>> =C2=A0 Subject: [PATCH] include/loki/SmallObj.h: ISO C++17 does not al=
low=20
>> dynamic
>> =C2=A0=C2=A0 exception specifications
>> +Upstream-Status: Pending
>> +
>> =C2=A0 Signed-off-by: Andrew Davis <afd@ti.com>
>> =C2=A0 ---
>> =C2=A0=C2=A0 include/loki/SmallObj.h | 15 ++-------------
>> diff --git=20
>> a/meta-arago-extras/recipes-support/loki/libloki/0001-include-loki-Thr=
eads.h-return-statement-with-a-value.patch b/meta-arago-extras/recipes-su=
pport/loki/libloki/0001-include-loki-Threads.h-return-statement-with-a-va=
lue.patch
>> index 91a78e88..3710a45b 100644
>> ---=20
>> a/meta-arago-extras/recipes-support/loki/libloki/0001-include-loki-Thr=
eads.h-return-statement-with-a-value.patch
>> +++=20
>> b/meta-arago-extras/recipes-support/loki/libloki/0001-include-loki-Thr=
eads.h-return-statement-with-a-value.patch
>> @@ -4,6 +4,8 @@ Date: Mon, 14 Nov 2016 19:41:28 -0500
>> =C2=A0 Subject: [PATCH] include/loki/Threads.h: return-statement with =
a=20
>> value, in
>> =C2=A0=C2=A0 function returning 'void'
>> +Upstream-Status: Pending
>> +
>> =C2=A0 Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>> =C2=A0 ---
>> =C2=A0=C2=A0 include/loki/Threads.h | 4 ++--
>> diff --git=20
>> a/meta-arago-extras/recipes-support/loki/libloki/0002-test-Function-Fu=
nctionTest.cpp-reference-to-bad_func.patch b/meta-arago-extras/recipes-su=
pport/loki/libloki/0002-test-Function-FunctionTest.cpp-reference-to-bad_f=
unc.patch
>> index 0de9f61c..3ee7d8ff 100644
>> ---=20
>> a/meta-arago-extras/recipes-support/loki/libloki/0002-test-Function-Fu=
nctionTest.cpp-reference-to-bad_func.patch
>> +++=20
>> b/meta-arago-extras/recipes-support/loki/libloki/0002-test-Function-Fu=
nctionTest.cpp-reference-to-bad_func.patch
>> @@ -4,6 +4,8 @@ Date: Mon, 14 Nov 2016 19:55:08 -0500
>> =C2=A0 Subject: [PATCH] test/Function/FunctionTest.cpp: reference to
>> =C2=A0=C2=A0 'bad_function_call' is ambiguous
>> +Upstream-Status: Pending
>> +
>> =C2=A0 Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>> =C2=A0 ---
>> =C2=A0=C2=A0 test/Function/FunctionTest.cpp | 2 +-
>> diff --git=20
>> a/meta-arago-extras/recipes-support/tensorflow-lite/files/apply-modifi=
cation-for-tflite-1.15-to-eigen.patch b/meta-arago-extras/recipes-support=
/tensorflow-lite/files/apply-modification-for-tflite-1.15-to-eigen.patch
>> index 06c9c63a..491dcbfa 100644
>> ---=20
>> a/meta-arago-extras/recipes-support/tensorflow-lite/files/apply-modifi=
cation-for-tflite-1.15-to-eigen.patch
>> +++=20
>> b/meta-arago-extras/recipes-support/tensorflow-lite/files/apply-modifi=
cation-for-tflite-1.15-to-eigen.patch
>> @@ -1,3 +1,6 @@
>> +
>> +Upstream-Status: Inappropriate [arago specific]
>> +
>> =C2=A0 diff --git=20
>> a/tensorflow/lite/tools/make/downloads/eigen/Eigen/src/Core/arch/NEON/=
Complex.h b/tensorflow/lite/tools/make/downloads/eigen/Eigen/src/Core/arc=
h/NEON/Complex.h
>> =C2=A0 index 306a309beb..4527a64c91 100644
>> =C2=A0 ---=20
>> a/tensorflow/lite/tools/make/downloads/eigen/Eigen/src/Core/arch/NEON/=
Complex.h
>> diff --git=20
>> a/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server/=
0001-Add-EST-Yang-Models.patch b/meta-arago-extras/recipes-sysrepo/netope=
er2-server/netopeer2-server/0001-Add-EST-Yang-Models.patch
>> index 10ed685d..983f594b 100644
>> ---=20
>> a/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server/=
0001-Add-EST-Yang-Models.patch
>> +++=20
>> b/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server/=
0001-Add-EST-Yang-Models.patch
>> @@ -1,3 +1,6 @@
>> +
>> +Upstream-Status: Inappropriate [arago specific]
>> +
>> =C2=A0 diff --git a/scripts/setup.sh b/scripts/setup.sh
>> =C2=A0 index 7bba711..4a98e66 100755
>> =C2=A0 --- a/scripts/setup.sh
>> diff --git=20
>> a/meta-arago-extras/recipes-sysrepo/sysrepo-plugins-common/0001-so-ver=
sion.patch b/meta-arago-extras/recipes-sysrepo/sysrepo-plugins-common/000=
1-so-version.patch
>> index 0eabf6a9..5e2fc3a5 100644
>> ---=20
>> a/meta-arago-extras/recipes-sysrepo/sysrepo-plugins-common/0001-so-ver=
sion.patch
>> +++=20
>> b/meta-arago-extras/recipes-sysrepo/sysrepo-plugins-common/0001-so-ver=
sion.patch
>> @@ -1,3 +1,6 @@
>> +
>> +Upstream-Status: Inappropriate [arago specific]
>> +
>> =C2=A0 diff --git a/CMakeLists.txt b/CMakeLists.txt
>> =C2=A0 index fd64b80..910510d 100644
>> =C2=A0 --- a/CMakeLists.txt
>> diff --git=20
>> a/meta-arago-extras/recipes-ti/linalg/files/0001-Makefile-fix-toolchai=
n-variables.patch b/meta-arago-extras/recipes-ti/linalg/files/0001-Makefi=
le-fix-toolchain-variables.patch
>> index af7c6a2b..df387977 100644
>> ---=20
>> a/meta-arago-extras/recipes-ti/linalg/files/0001-Makefile-fix-toolchai=
n-variables.patch
>> +++=20
>> b/meta-arago-extras/recipes-ti/linalg/files/0001-Makefile-fix-toolchai=
n-variables.patch
>> @@ -3,6 +3,8 @@ From: Denys Dmytriyenko <denys@ti.com>
>> =C2=A0 Date: Sun, 26 Mar 2017 18:17:06 -0400
>> =C2=A0 Subject: [PATCH] Makefile: fix toolchain variables
>> +Upstream-Status: Inappropriate [oe specific]
>> +
>> =C2=A0 Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>> =C2=A0 ---
>> =C2=A0=C2=A0 examples/arm+dsp/make.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 -
>> diff --git=20
>> a/meta-arago-extras/recipes-ti/linalg/files/0001-Makefile-pass-PARALLE=
L_MAKE-variable-to-overwrite-j8.patch b/meta-arago-extras/recipes-ti/lina=
lg/files/0001-Makefile-pass-PARALLEL_MAKE-variable-to-overwrite-j8.patch
>> index dacea7a5..7d2f1409 100644
>> ---=20
>> a/meta-arago-extras/recipes-ti/linalg/files/0001-Makefile-pass-PARALLE=
L_MAKE-variable-to-overwrite-j8.patch
>> +++=20
>> b/meta-arago-extras/recipes-ti/linalg/files/0001-Makefile-pass-PARALLE=
L_MAKE-variable-to-overwrite-j8.patch
>> @@ -3,6 +3,8 @@ From: Denys Dmytriyenko <denys@ti.com>
>> =C2=A0 Date: Wed, 29 Mar 2017 13:09:05 -0400
>> =C2=A0 Subject: [PATCH] Makefile: pass PARALLEL_MAKE variable to overw=
rite -j8
>> +Upstream-Status: Inappropriate [oe specific]
>> +
>> =C2=A0 Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>> =C2=A0 ---
>> =C2=A0=C2=A0 src/ti/linalg/Makefile | 12 +++++++-----
>> diff --git=20
>> a/meta-arago-extras/recipes-ti/ocl/ocl/0001-float_compute-matmpy-Link-=
with-libdl-to-resolve-link.patch b/meta-arago-extras/recipes-ti/ocl/ocl/0=
001-float_compute-matmpy-Link-with-libdl-to-resolve-link.patch
>> index dd13d731..43bc9900 100644
>> ---=20
>> a/meta-arago-extras/recipes-ti/ocl/ocl/0001-float_compute-matmpy-Link-=
with-libdl-to-resolve-link.patch
>> +++=20
>> b/meta-arago-extras/recipes-ti/ocl/ocl/0001-float_compute-matmpy-Link-=
with-libdl-to-resolve-link.patch
>> @@ -7,6 +7,8 @@ Subject: [PATCH] float_compute, matmpy: Link with=20
>> libdl to resolve linking
>> =C2=A0 * with GCC 5.3 toolchain, linking with libgomp also requires li=
nking
>> =C2=A0=C2=A0=C2=A0 with libdl
>> +Upstream-Status: Pending
>> +
>> =C2=A0 Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
>> =C2=A0 ---
>> =C2=A0=C2=A0 examples/float_compute/Makefile | 2 +-
>> diff --git=20
>> a/meta-arago-extras/recipes-ti/tiovx/files/0001-Fix-paths-for-Yocto-bu=
ild-and-add-RTOS-build-var.patch b/meta-arago-extras/recipes-ti/tiovx/fil=
es/0001-Fix-paths-for-Yocto-build-and-add-RTOS-build-var.patch
>> index 1e667b87..ff80debc 100644
>> ---=20
>> a/meta-arago-extras/recipes-ti/tiovx/files/0001-Fix-paths-for-Yocto-bu=
ild-and-add-RTOS-build-var.patch
>> +++=20
>> b/meta-arago-extras/recipes-ti/tiovx/files/0001-Fix-paths-for-Yocto-bu=
ild-and-add-RTOS-build-var.patch
>> @@ -3,6 +3,8 @@ From: Djordje Senicic <d-senicic1@ti.com>
>> =C2=A0 Date: Mon, 14 Aug 2017 10:26:39 -0400
>> =C2=A0 Subject: [PATCH] Fix paths for Yocto build and add RTOS build v=
ar
>> +Upstream-Status: Inappropriate [oe specific]
>> +
>> =C2=A0 Signed-off-by: Djordje Senicic <d-senicic1@ti.com>
>> =C2=A0 ---
>> =C2=A0=C2=A0 Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 27 +++++++++++++++++++--------
>> diff --git=20
>> a/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/0001-fix-out-of-=
tree-config.patch b/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/0=
001-fix-out-of-tree-config.patch
>> index e8a02979..003d2523 100644
>> ---=20
>> a/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/0001-fix-out-of-=
tree-config.patch
>> +++=20
>> b/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/0001-fix-out-of-=
tree-config.patch
>> @@ -7,6 +7,8 @@ header is not found due to the hard path.
>> =C2=A0 We now make the path for package header relative to our 'srcdir=
' so=20
>> it is
>> =C2=A0 found appropriately.
>> +Upstream-Status: Inappropriate [oe specific]
>> +
>> =C2=A0 Signed-off-by: Awais Belal <awais_belal@mentor.com>
>> =C2=A0 ---
>> =C2=A0 diff --git a/configure.ac b/configure.ac
>> diff --git=20
>> a/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/0001-headers.h-r=
emove-math.h-include-that-breaks-aarch64.patch b/meta-arago-test/recipes-=
benchmark/iperf/iperf-2.0.5/0001-headers.h-remove-math.h-include-that-bre=
aks-aarch64.patch
>> index abd2315b..8d9e03f6 100644
>> ---=20
>> a/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/0001-headers.h-r=
emove-math.h-include-that-breaks-aarch64.patch
>> +++=20
>> b/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/0001-headers.h-r=
emove-math.h-include-that-breaks-aarch64.patch
>> @@ -18,6 +18,8 @@ Content-Transfer-Encoding: 8bit
>> =C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct __is_integer<bool>
>> =C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ^~~~~~~~~~~~~~~~~~
>> +Upstream-Status: Inappropriate [oe specific]
>> +
>> =C2=A0 Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>> =C2=A0 ---
>> =C2=A0=C2=A0 include/headers.h | 1 -
>> diff --git=20
>> a/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/0002-fix-bool-si=
ze-m4.patch b/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/0002-fi=
x-bool-size-m4.patch
>> index 348e316c..a6001b10 100644
>> ---=20
>> a/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/0002-fix-bool-si=
ze-m4.patch
>> +++=20
>> b/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/0002-fix-bool-si=
ze-m4.patch
>> @@ -1,3 +1,6 @@
>> +
>> +Upstream-Status: Pending
>> +
>> =C2=A0 --- iperf-2.0.5/m4/dast.m4.orig=C2=A0=C2=A0=C2=A0 2016-06-15 11=
:42:03.945581785 -0400
>> =C2=A0 +++ iperf-2.0.5/m4/dast.m4=C2=A0=C2=A0=C2=A0 2016-06-15 11:42:1=
1.053581641 -0400
>> =C2=A0 @@ -11,7 +11,12 @@
>> diff --git=20
>> a/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/iperf-2.0.5_ManP=
age.patch b/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/iperf-2.0=
.5_ManPage.patch
>> index 12e8f463..97cf1ff4 100755
>> ---=20
>> a/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/iperf-2.0.5_ManP=
age.patch
>> +++=20
>> b/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/iperf-2.0.5_ManP=
age.patch
>> @@ -1,3 +1,5 @@
>> +Upstream-Status: Inappropriate [arago specific]
>> +
>> =C2=A0 diff --git iperf-2.0.5/man/Makefile.am iperf-2.0.5/man/Makefile=
.am
>> =C2=A0=C2=A0 index ed97bc6..728873f 100644
>> =C2=A0 --- iperf-2.0.5/man/Makefile.am
>> diff --git=20
>> a/meta-arago-test/recipes-devtools/input-utils/input-utils/0001-autoco=
nf-fix-for-cross-compilation-for-ARM.patch b/meta-arago-test/recipes-devt=
ools/input-utils/input-utils/0001-autoconf-fix-for-cross-compilation-for-=
ARM.patch
>> index 72308690..075920b4 100644
>> ---=20
>> a/meta-arago-test/recipes-devtools/input-utils/input-utils/0001-autoco=
nf-fix-for-cross-compilation-for-ARM.patch
>> +++=20
>> b/meta-arago-test/recipes-devtools/input-utils/input-utils/0001-autoco=
nf-fix-for-cross-compilation-for-ARM.patch
>> @@ -6,6 +6,8 @@ Subject: [PATCH] autoconf: fix for cross compilation=20
>> for ARM
>> =C2=A0 * Based on changes from Yebio Mesfin fixup the input-utils to
>> =C2=A0=C2=A0=C2=A0 cross compile for ARM.
>> +Upstream-Status: Inappropriate [oe specific]
>> +
>> =C2=A0 Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
>> =C2=A0 ---
>> =C2=A0=C2=A0 mk/Autoconf.mk=C2=A0 |=C2=A0=C2=A0=C2=A0 8 ++++++--
>> diff --git=20
>> a/meta-arago-test/recipes-graphics/omapdrmtest/files/0001-Makefile.am-=
lblah-flags-belong-to-LDADD-not-LDFLAGS.patch b/meta-arago-test/recipes-g=
raphics/omapdrmtest/files/0001-Makefile.am-lblah-flags-belong-to-LDADD-no=
t-LDFLAGS.patch
>> index f973500c..0adb30b7 100644
>> ---=20
>> a/meta-arago-test/recipes-graphics/omapdrmtest/files/0001-Makefile.am-=
lblah-flags-belong-to-LDADD-not-LDFLAGS.patch
>> +++=20
>> b/meta-arago-test/recipes-graphics/omapdrmtest/files/0001-Makefile.am-=
lblah-flags-belong-to-LDADD-not-LDFLAGS.patch
>> @@ -3,6 +3,8 @@ From: Denys Dmytriyenko <denys@ti.com>
>> =C2=A0 Date: Wed, 4 Apr 2018 20:09:54 -0400
>> =C2=A0 Subject: [PATCH] Makefile.am: -lblah flags belong to LDADD, not=
 LDFLAGS
>> +Upstream-Status: Inappropriate [oe specific]
>> +
>> =C2=A0 Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>> =C2=A0 ---
>> =C2=A0=C2=A0 Makefile.am | 3 +--
>> --=20
>> 2.17.1
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online=20
>> (#15383):https://urldefense.com/v3/__https://lists.yoctoproject.org/g/=
meta-arago/message/15383__;!!G3vK!U9hQUOynrU7Ehw3k-U0BB1YB00PTTyPow1EJYYH=
Sh6LI_KH7dBjbeODabitL5qA1GWPDbUfOO4ZoxoGOzLszfxPXYYhbWiY32g$
>> Mute This=20
>> Topic:https://urldefense.com/v3/__https://lists.yoctoproject.org/mt/10=
6654448/7030289__;!!G3vK!U9hQUOynrU7Ehw3k-U0BB1YB00PTTyPow1EJYYHSh6LI_KH7=
dBjbeODabitL5qA1GWPDbUfOO4ZoxoGOzLszfxPXYYhjFuaC4g$
>> Group Owner: meta-arago+owner@lists.yoctoproject.org
>> Unsubscribe:https://urldefense.com/v3/__https://lists.yoctoproject.org=
/g/meta-arago/unsub__;!!G3vK!U9hQUOynrU7Ehw3k-U0BB1YB00PTTyPow1EJYYHSh6LI=
_KH7dBjbeODabitL5qA1GWPDbUfOO4ZoxoGOzLszfxPXYYir3Mgyyg$=C2=A0 [c-shilwant=
@ti.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

