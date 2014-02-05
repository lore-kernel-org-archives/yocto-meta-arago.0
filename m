Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 674CC529AA
	for <meta-arago@arago-project.org>;
	Wed,  5 Feb 2014 17:50:09 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s15Ho8RK024248
	for <meta-arago@arago-project.org>; Wed, 5 Feb 2014 11:50:08 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s15Ho8un004475
	for <meta-arago@arago-project.org>; Wed, 5 Feb 2014 11:50:08 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Wed, 5 Feb 2014 11:50:08 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Aravind Batni <aravindbr@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>, "Nelson, Sam" <sam.nelson@ti.com>
Thread-Topic: [meta-arago] [PATCH] ti-csl: new recipe providing CSL for
	TI-KeyStone2 devices -This package provides chip support	library
	interface files
Thread-Index: AQHPIfJZVDVPG63kxkiC+fxmXLz0I5qlrYcAgAGjvgD//5+yoA==
Date: Wed, 5 Feb 2014 17:50:07 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015994C06A@DLEE11.ent.ti.com>
References: <1391549971-21990-1-git-send-email-aravindbr@ti.com>
	<7D46E86EC0A8354091174257B2FED10159948BED@DLEE11.ent.ti.com>
	<941289A393E94C478C153EF5E432FDBB3EA68B50@DBDE04.ent.ti.com>
In-Reply-To: <941289A393E94C478C153EF5E432FDBB3EA68B50@DBDE04.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] ti-csl: new recipe providing CSL for	TI-KeyStone2 devices -This package provides chip support	library interface files
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: <meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Feb 2014 17:50:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: Aravind Batni
>Sent: Wednesday, February 05, 2014 12:33 PM
>To: Maupin, Chase; meta-arago@arago-project.org; Nelson, Sam
>Subject: RE: [meta-arago] [PATCH] ti-csl: new recipe providing CSL
>for TI-KeyStone2 devices -This package provides chip support
>library interface files
>
>Thanks for the feedback.  See response in-lined.
>
>-Best Regards,
>Aravind
>
>
>> -----Original Message-----
>> From: Maupin, Chase
>> Sent: Tuesday, February 04, 2014 5:37 PM
>> To: Aravind Batni; meta-arago@arago-project.org; Nelson, Sam
>> Subject: RE: [meta-arago] [PATCH] ti-csl: new recipe providing
>CSL for TI-
>> KeyStone2 devices -This package provides chip support library
>interface files
>>
>> >-----Original Message-----
>> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>> >bounces@arago-project.org] On Behalf Of Aravind Batni
>> >Sent: Tuesday, February 04, 2014 4:40 PM
>> >To: meta-arago@arago-project.org; Nelson, Sam
>> >Cc: Aravind Batni
>> >Subject: [meta-arago] [PATCH] ti-csl: new recipe providing CSL
>for
>> >TI-KeyStone2 devices -This package provides chip support
>library
>> >interface files
>>
>> Thanks for the submission.  Some review comments below.
>>
>> This looks like a malformed commit message

Any comment here?  Also, when you submit v2 be sure to add something like t=
he below after your signed-off-by line:

---
* Updated in version 2
	* change 1
	* change 2

The --- above is important.

>>
>> >
>> >Signed-off-by: Aravind Batni <aravindbr@ti.com>
>> >---
>> > meta-arago-extras/recipes-bsp/ti-csl/ti-csl_git.bb |   27
>> >++++++++++++++++++++
>> > 1 file changed, 27 insertions(+)
>> > create mode 100644 meta-arago-extras/recipes-bsp/ti-csl/ti-
>> >csl_git.bb
>> >
>> >diff --git a/meta-arago-extras/recipes-bsp/ti-csl/ti-csl_git.bb
>> >b/meta-arago-extras/recipes-bsp/ti-csl/ti-csl_git.bb
>> >new file mode 100644
>> >index 0000000..2896506
>> >--- /dev/null
>> >+++ b/meta-arago-extras/recipes-bsp/ti-csl/ti-csl_git.bb
>> >@@ -0,0 +1,27 @@
>> >+DESCRIPTION =3D "TI CSL"
>> >+LICENSE =3D "TI BSD"
>>
>> Any reason this can't just be BSD?
>>
>[Aravind Batni] The components were approved by TI OSRB for TI BSD
>(has TI copyright statement on the top and BSD license text
>below). Not sure if we can change this to BSD

OK

>> >+LIC_FILES_CHKSUM =3D
>> >"file://COPYING.txt;md5=3D5857833e20836213677fac33f9aded21"
>> >+
>> >+COMPATIBLE_MACHINE =3D "keystone-evm"
>> >+ALLOW_EMPTY_${PN} =3D "1"
>>
>> Why do you want an empty package?  Judging from below this is
>because
>> you are only trying to install headers right and those will be
>part of the dev
>> package?  Just want to make sure I understand your purpose here.

Any comment here?

>>
>> >+
>> >+PR =3D "r1"
>>
>> Start with r0
>>
>[Aravind Batni]  Fixed
>> >+BRANCH=3D"master"
>> >+LLD-NAME=3D"csl"
>>
>> Unused variable?
>>
>[Aravind Batni] Removed the unused variable
>> >+SRC_URI =3D "git://git.ti.com/keystone-rtos/common-csl-
>> >ip.git;protocol=3Dgit;branch=3D${BRANCH}"
>> >+
>> >+S =3D "${WORKDIR}/git"
>> >+# commit ID corresponds to DEV.CSL_KEYSTONE2.02.00.00.17
>SRCREV =3D
>> >+"f6f90144c14e1ee783c4b893b52e54830be8166e"
>>
>> Just a nitpick but this would make more sense being declared
>before the
>> SRC_URI line.  Next to the BRANCH setting.
>>
>[Aravind Batni] Fixed
>> >+
>> >+do_install () {
>> >+    install -d ${D}/${includedir}/ti/csl
>> >+    cp -r ${S}/* ${D}/${includedir}/ti/csl
>>
>> Use install command.  Also, no need for the / between ${D} and
>${includedir}
>>
>> >+#   Retain only header files
>> >+    cd ${D}/${includedir}/ti/csl
>> >+    find . \( -name "*.xdt" -o -name "*.bld" -o -name "*.bat"
>-o
>> >-name "*.c" -o -name "*.xdc" -o -name "*.asm" -o -name "*.xs"
>\) |
>> >xargs rm -rf
>>
>> This seems kludgy.  Why not just find all the .h files and then
>install those
>> with a for loop?
>>
>> >+    rm -rf build docs
>> >+    mkdir -p src/ip/serdes_sb
>>
>[Aravind Batni] How about something like this: find ${S} -name
>"*.h" -type f | xargs -I {} cp --parents {}
>${D}${includedir}/ti/csl

Seems OK to me

>> Implicit assumption that you are in a certain directory.  Please
>reference
>> everything from ${D}
>>
>> >+    cp -r ${S}/src/ip/serdes_sb/V0 src/ip/serdes_sb
>>
>> Same comment about the assumption of directory location.
>>
>[Aravind Batni]  same as before: How about this: find
>${S}/src/ip/serdes_sb/V0 -name "*.c" -type f | xargs -I {} cp --
>parents {} ${D}${includedir}/ti/csl/src/ip/serdes_sb/V0
>> >+}
>> >+
>> >--
>> >1.7.9.5
>> >
>> >_______________________________________________
>> >meta-arago mailing list
>> >meta-arago@arago-project.org
>> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

