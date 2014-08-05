Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 5248252A79
	for <meta-arago@arago-project.org>;
	Tue,  5 Aug 2014 13:18:07 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s75DI6ZB018712
	for <meta-arago@arago-project.org>; Tue, 5 Aug 2014 08:18:06 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s75DI6C2032413
	for <meta-arago@arago-project.org>; Tue, 5 Aug 2014 08:18:06 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Tue, 5 Aug 2014 08:18:06 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Machani, Yaniv" <yanivma@ti.com>
Thread-Topic: [meta-arago] [PATCH 1/2 v2] wl18xx-compat: version update
Thread-Index: AQHPsClnW4kUmIEhl0qnfL8X5MptyJvA8xWQ
Date: Tue, 5 Aug 2014 13:18:05 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015D1A00A8@DLEE11.ent.ti.com>
References: <1406842115-5938-1-git-send-email-yanivma@ti.com>
	<20140804211639.GZ15788@edge>
In-Reply-To: <20140804211639.GZ15788@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 1/2 v2] wl18xx-compat: version update
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
X-List-Received-Date: Tue, 05 Aug 2014 13:18:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
>Sent: Monday, August 04, 2014 4:17 PM
>To: Machani, Yaniv
>Cc: meta-arago@arago-project.org
>Subject: Re: [meta-arago] [PATCH 1/2 v2] wl18xx-compat: version
>update
>
>On Fri, Aug 01, 2014 at 12:28:34AM +0300, Yaniv Machani wrote:
>> - Update to latest version tag - ol_r8.a9.14
>> - move to git.ti.com and use backports module.
>> - clean some unused commands.
>>
>> Signed-off-by: Yaniv Machani <yanivma@ti.com>
>> ---
>> v2 - Updated after inputs
>> changed to wl18xx, combined PR.
>> format-patch didn't recognized it as renamed file.
>>
>>  .../packagegroup-arago-tisdk-connectivity.bb       |    1 +
>>  .../ti-compat-wireless-wl18xx_r8.a8.10.bb          |   61 -----
>---------------
>>  .../ti-compat-wireless-wl18xx_r8.a9.14.bb          |   56
>++++++++++++++++++
>>  3 files changed, 57 insertions(+), 61 deletions(-)
>>  delete mode 100644 meta-arago-extras/recipes-bsp/ti-compat-
>wireless/ti-compat-wireless-wl18xx_r8.a8.10.bb
>>  create mode 100644 meta-arago-extras/recipes-bsp/ti-compat-
>wireless/ti-compat-wireless-wl18xx_r8.a9.14.bb
>>
>> diff --git a/meta-arago-distro/recipes-
>core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
>b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
>tisdk-connectivity.bb
>> index fa82e7e..fafffee 100755
>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
>arago-tisdk-connectivity.bb
>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
>arago-tisdk-connectivity.bb
>> @@ -31,6 +31,7 @@ WLAN_COMMON =3D "\
>>  #    netperf
>>
>>  FIRMWARE_AND_DRIVERS =3D "\
>> +    ti-compat-wireless-wl18xx \
>>      wl18xx-firmware \
>>  "
>>
>> diff --git a/meta-arago-extras/recipes-bsp/ti-compat-
>wireless/ti-compat-wireless-wl18xx_r8.a8.10.bb b/meta-arago-
>extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-
>wl18xx_r8.a8.10.bb
>> deleted file mode 100644
>> index 0e7281a..0000000
>> --- a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-
>compat-wireless-wl18xx_r8.a8.10.bb
>> +++ /dev/null
>> @@ -1,61 +0,0 @@
>> -# This is a TI specific version of the compat-wireless recipe
>using a
>> -# compat-wireless package created from the TI Systems Tested
>mac80211 releases.
>> -
>> -DESCRIPTION =3D "ti compat-wireless drivers for wl18xx"
>> -HOMEPAGE =3D "https://gforge.ti.com/gf/project/ecs_nlcp/"
>> -SECTION =3D "kernel/modules"
>> -LICENSE =3D "GPLv2"
>> -LIC_FILES_CHKSUM =3D
>"file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7cd7"
>> -
>> -RDEPENDS_${PN} =3D "wireless-tools"
>> -
>> -PROVIDES +=3D "ti-compat-wireless-wl12xx"
>> -RPROVIDES_${PN} +=3D "ti-compat-wireless-wl12xx"
>> -RREPLACES_${PN} +=3D "ti-compat-wireless-wl12xx"
>> -RCONFLICTS_${PN} +=3D "ti-compat-wireless-wl12xx"
>> -
>> -COMPATIBLE_MACHINE =3D "(omap-a15)"
>> -
>> -PV =3D "r8.a8.08"
>> -inherit module
>> -
>> -PR =3D "${MACHINE_KERNEL_PR}"
>> -PR_append =3D "b"
>> -
>> -# Tags: ol_r8.a8.10
>> -SRCREV_wl18xx =3D "eaa1820c02dc076e6ad9254e9cb7a3bb0c17471b"
>> -SRCREV_compat =3D "5d80865281795f962e1400a95202bbd07dd763c0"
>> -SRCREV_compat-wireless =3D
>"23a0d62ea1a57327709a77f08d6265ec807a909f"
>> -
>> -SRCREV_FORMAT =3D "compat-wireless"
>> -
>> -S =3D "${WORKDIR}/compat-wireless"
>> -
>> -SRC_URI =3D "git://github.com/TI-OpenLink/compat-
>wireless.git;destsuffix=3Dcompat-wireless;name=3Dcompat-wireless \
>> -           git://github.com/TI-
>OpenLink/compat.git;destsuffix=3Dcompat;name=3Dcompat \
>> -           git://github.com/TI-
>OpenLink/wl18xx.git;destsuffix=3Dwl18xx;name=3Dwl18xx \
>> -"
>> -
>> -EXTRA_OEMAKE =3D "KLIB_BUILD=3D${STAGING_KERNEL_DIR} KLIB=3D${D}"
>> -
>> -do_configure() {
>> -    cd ${S}
>> -    GIT_TREE=3D"${WORKDIR}/wl18xx"
>GIT_COMPAT_TREE=3D"${WORKDIR}/compat" ./scripts/admin-refresh.sh
>network
>> -    ./scripts/driver-select wl18xx
>> -
>> -    # Now generate the sourceipk with the properly configured
>sources
>> -    sourceipk_do_create_srcipk
>> -}
>> -
>> -do_configure_append() {
>> -    sed -i "s#@./scripts/update-initramfs## " Makefile
>> -}
>> -
>> -do_install() {
>> -    # Remove hardcoded references to host depmod
>> -    sed -i "s#@/sbin/depmod -a## " Makefile
>> -    sed -i "s#@/sbin/depmod -ae## " Makefile
>> -
>> -    # Install modules
>> -    oe_runmake DEPMOD=3Decho DESTDIR=3D"${D}"
>INSTALL_MOD_PATH=3D"${D}" LDFLAGS=3D"" install-modules
>> -}
>> diff --git a/meta-arago-extras/recipes-bsp/ti-compat-
>wireless/ti-compat-wireless-wl18xx_r8.a9.14.bb b/meta-arago-
>extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-
>wl18xx_r8.a9.14.bb
>> new file mode 100644
>> index 0000000..a5d5429
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-
>compat-wireless-wl18xx_r8.a9.14.bb
>> @@ -0,0 +1,56 @@
>> +# This is a TI specific version of the compat-wireless recipe
>using a
>> +# compat-wireless package created from the TI Systems Tested
>mac80211 releases.
>> +
>> +DESCRIPTION =3D "ti compat-wireless drivers for wl18xx"
>> +HOMEPAGE =3D "https://git.ti.com/wilink8-wlan/wl18xx"
>> +SECTION =3D "kernel/modules"
>> +LICENSE =3D "GPLv2"
>> +LIC_FILES_CHKSUM =3D
>"file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7cd7"
>> +
>> +RDEPENDS_${PN} =3D "wireless-tools"
>> +
>> +PROVIDES +=3D "ti-compat-wireless-wl18xx"
>> +RPROVIDES_${PN} +=3D "ti-compat-wireless-wl18xx"
>> +RREPLACES_${PN} +=3D "ti-compat-wireless-wl18xx"
>> +RCONFLICTS_${PN} +=3D "ti-compat-wireless-wl18xx"
>
>Sorry, now I'm confused. I didn't understand Chase's original
>comment here,
>but now, after the change, it doesn't make any sense - the recipe
>named
>ti-compat-wireless-wl18xx already PROVIDES and RPROVIDES the same,
>plus it
>cannot RREPLACES and RCONFLICTS to itself. So, what's the purpose
>of the above
>4 lines?

My comment was he was providing ti-compat-wireless-wl12xx but at the same t=
ime was adding ti-compat-wireless-wl18xx to the list of packages to install=
.  I guess I was thinking that he didn't need to do both.

>
>
>> +PV =3D "r8.a9.14"
>> +inherit module
>> +
>> +PR =3D "${MACHINE_KERNEL_PR}+a+gitr${SRCPV}"
>> +
>> +# Tags: ol_r8.a9.14
>> +SRCREV_wl18xx =3D "0e48c4b55cfa0d557a098cbe92b1f092f1a9ad67"
>> +BRANCH_wl18xx =3D "ap_p2p"
>> +SRCREV_backports =3D "0d46f43a2f3ccdd53de19eee5b9c674bf8ef09a2"
>> +BRANCH_backports =3D "ap_dfs_mbss_all"
>> +
>> +SRCREV_FORMAT =3D "wl18xx"
>> +
>> +S =3D "${WORKDIR}/compat-wireless"
>> +
>> +SRC_URI =3D "git://git.ti.com/wilink8-
>wlan/wl18xx.git;branch=3D${BRANCH_wl18xx};destsuffix=3Dwl18xx;name=3Dwl1
>8xx \
>> +           git://git.ti.com/wilink8-
>wlan/backports.git;branch=3D${BRANCH_backports};destsuffix=3Dbackports
>;name=3Dbackports \
>> + "
>> +
>> +export KLIB_BUILD=3D"${STAGING_KERNEL_DIR}"
>> +export KLIB=3D"${D}"
>> +
>> +do_configure() {
>> +    cd "${WORKDIR}/backports"
>> +    unset CC
>> +    #Generate compat-wireless
>> +    python ./gentree.py --clean  "${WORKDIR}/wl18xx"
>"${WORKDIR}/compat-wireless"
>> +
>> +    cd ${S}
>> +    make defconfig-wl18xx
>> +
>> +    # Now generate the sourceipk with the properly configured
>sources
>> +	sourceipk_do_create_srcipk
>> +}
>> +
>> +do_install() {
>> +    # Install modules
>> +    oe_runmake modules_install
>> +}
>> +
>> --
>> 1.7.9
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

