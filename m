Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 11413529F3
	for <meta-arago@arago-project.org>;
	Sat,  8 Sep 2012 17:27:41 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q88HRec6017232;
	Sat, 8 Sep 2012 12:27:40 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q88HRePg015130;
	Sat, 8 Sep 2012 12:27:40 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Sat, 8 Sep 2012 12:27:40 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [meta-arago-distro][PATCH 1/2 v2] pinmux-utility:
	Add	pinmux utility
Thread-Index: AQHNjSnzPno0MtdSoUKhtRF/1SQAFpeAmQ/QgAAHSHmAAGaeAP//rTQF
Date: Sat, 8 Sep 2012 17:27:39 +0000
Message-ID: <2EE4798B-19EE-4C3E-A2F4-2A8F6F3A3205@ti.com>
References: <1347044999-25201-1-git-send-email-fcooper27jr@gmail.com>
	<7D46E86EC0A8354091174257B2FED101591DD99D@DLEE12.ent.ti.com>
	<03486037-E0B7-4025-898E-93D2E2517F58@ti.com>,
	<20120908172400.GB23896@denix.org>
In-Reply-To: <20120908172400.GB23896@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>,
	"Franklin S. Cooper Jr" <fcooper27jr@gmail.com>
Subject: Re: [meta-arago-distro][PATCH 1/2 v2] pinmux-utility: Add	pinmux utility
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
X-List-Received-Date: Sat, 08 Sep 2012 17:27:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

That makes sense. Will do.

On Sep 8, 2012, at 12:24 PM, "Dmytriyenko, Denys" <denys@ti.com> wrote:

> On Sat, Sep 08, 2012 at 04:16:42PM +0000, Cooper Jr., Franklin wrote:
>> I'm unsure about this. I would think that is the point of an app or=20
>> library's release notes.
>=20
> No, what Chase meant is for re-submition of the patches, it's common to=20
> explain what's different between v1 and v2 of the same patch. It's usuall=
y=20
> done after the --- line and before the actual diff, as that part is lost =
and=20
> won't go into the git commit description. See below...
>=20
>=20
>> On Sep 8, 2012, at 10:52 AM, "Maupin, Chase" <chase.maupin@ti.com> wrote=
:
>>=20
>>> Please start adding
>>>=20
>>> ---
>>> Update in version x
>>>   * item 1
>>>   * item 2
>>>=20
>>>=20
>>> That way we know why there is a new version.
>>>=20
>>>> -----Original Message-----
>>>> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>>>> bounces@arago-project.org] On Behalf Of Franklin S. Cooper Jr
>>>> Sent: Friday, September 07, 2012 2:10 PM
>>>> To: meta-arago@arago-project.org
>>>> Cc: Franklin S. Cooper Jr
>>>> Subject: [meta-arago] [meta-arago-distro][PATCH 1/2 v2] pinmux-
>>>> utility: Add pinmux utility
>>>>=20
>>>> * Add Windows base pinmux utility
>>>> * Port pinmux-utility recipe from arago.
>>>> * The current recipe pulls in a zip file that doesn't contain
>>>> license information. License information will be added in an
>>>> updated recipe.
>>>>=20
>>>> Signed-off-by: Franklin S. Cooper Jr <fcooper27jr@gmail.com>
>>>> ---
>=20
> Here is the proper place for any comments you don't want to go into the c=
ommit=20
> description, such as the reason for resubmitting the patch. Like this:
>=20
> * Version 2 of the patch addresses comments about blah.
>=20
>=20
>>>> .../pinmux-utility/pinmux-utility.inc              |   19
>>>> +++++++++++++++
>>>> .../pinmux-utility/pinmux-utility_2.3.1.0.bb       |   25
>>>> ++++++++++++++++++++
>>>> 2 files changed, 44 insertions(+), 0 deletions(-)
>>>> create mode 100644 meta-arago-distro/recipes-arago/pinmux-
>>>> utility/pinmux-utility.inc
>>>> create mode 100644 meta-arago-distro/recipes-arago/pinmux-
>>>> utility/pinmux-utility_2.3.1.0.bb
>>>>=20
>>>> diff --git a/meta-arago-distro/recipes-arago/pinmux-
>>>> utility/pinmux-utility.inc b/meta-arago-distro/recipes-
>>>> arago/pinmux-utility/pinmux-utility.inc
>>>> new file mode 100644
>>>> index 0000000..46d409d
>>>> --- /dev/null
>>>> +++ b/meta-arago-distro/recipes-arago/pinmux-utility/pinmux-
>>>> utility.inc
>>>> @@ -0,0 +1,19 @@
>>>> +DESCRIPTION =3D "Texas Instruments Pinmux Utility"
>>>> +LICENSE =3D "BSD"
>>>> +
>>>> +PR =3D "r0"
>>>> +
>>>> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>>> +
>>>> +S =3D "${WORKDIR}/${P}"
>>>> +
>>>> +installdir =3D "host-tools/pinmux_utils/windows"
>>>> +
>>>> +do_install() {
>>>> +    install -d ${D}/${installdir}
>>>> +    install ${S}/Pin_Mux_Utility.msi ${D}/${installdir}
>>>> +    install ${S}/setup.exe ${D}/${installdir}
>>>> +    install ${S}/Release_Notes.txt ${D}/${installdir}
>>>> +}
>>>> +
>>>> +FILES_${PN} +=3D "${installdir}/*"
>>>> diff --git a/meta-arago-distro/recipes-arago/pinmux-
>>>> utility/pinmux-utility_2.3.1.0.bb b/meta-arago-distro/recipes-
>>>> arago/pinmux-utility/pinmux-utility_2.3.1.0.bb
>>>> new file mode 100644
>>>> index 0000000..e966f3a
>>>> --- /dev/null
>>>> +++ b/meta-arago-distro/recipes-arago/pinmux-utility/pinmux-
>>>> utility_2.3.1.0.bb
>>>> @@ -0,0 +1,25 @@
>>>> +require pinmux-utility.inc
>>>> +
>>>> +PR_append =3D "-arago0"
>>>> +
>>>> +SRC_URI =3D "\
>>>> +
>>>> https://gforge.ti.com/gf/download/frsrelease/815/5471/PinMuxUtili
>>>> ty_v2_03_01_00.zip;name=3Dbase;subdir=3D${P} \
>>>> +"
>>>> +SRC_URI[base.md5sum] =3D "31f28b06f72c042e5400fc53b4a29c0e"
>>>> +SRC_URI[base.sha256sum] =3D
>>>> "2b0de3592c5f4b803a207d092dba227d10e1af65e0d4f06e1d8d23f317a452f9
>>>> "
>>>> +
>>>> +# Currently for omapl138 devices we are using a different pinmux
>>>> utility
>>>> +# program.  This requires a separate SRC_URI as well as a
>>>> different
>>>> +# do_install.
>>>> +SRC_URI_omapl138 =3D "\
>>>> +
>>>> https://gforge.ti.com/gf/download/frsrelease/461/4210/Pin_Setup_A
>>>> M18xx_01_00_1076_03.zip;name=3Domapl138;subdir=3D${P} \
>>>> +"
>>>> +
>>>> +do_install_omapl138() {
>>>> +    install -d ${D}/${installdir}
>>>> +    cp -rf ${S}/bin ${D}/${installdir}/
>>>> +    cp -rf ${S}/configurations ${D}/${installdir}/
>>>> +}
>>>> +
>>>> +SRC_URI[omapl138.md5sum] =3D "5a4eb834bde44c662aaf669882adbfe6"
>>>> +SRC_URI[omapl138.sha256sum] =3D
>>>> "6701ca0e91761b9eb80b0097fbb2e2ce2cd8e0bcdc0bd18c34cd0221d9d450d0
>>>> "
>>>> --
>>>> 1.7.0.4
>>>>=20
>>>> _______________________________________________
>>>> meta-arago mailing list
>>>> meta-arago@arago-project.org
>>>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>>> _______________________________________________
>>> meta-arago mailing list
>>> meta-arago@arago-project.org
>>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>>=20

