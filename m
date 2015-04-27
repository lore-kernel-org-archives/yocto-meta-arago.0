Return-Path: <karthik.ramanan@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 7EA67529E0
	for <meta-arago@arago-project.org>;
	Mon, 27 Apr 2015 11:06:12 +0000 (UTC)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3RB6AEQ031126
	for <meta-arago@arago-project.org>; Mon, 27 Apr 2015 06:06:11 -0500
Received: from DBDE73.ent.ti.com (dbde73.ent.ti.com [172.24.171.98])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3RB67L3027677
	for <meta-arago@arago-project.org>; Mon, 27 Apr 2015 16:36:08 +0530
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE73.ent.ti.com ([fe80::bc19:dc43:44da:7415%27]) with mapi id
	14.03.0224.002; Mon, 27 Apr 2015 16:36:06 +0530
From: "R, Karthik" <karthik.ramanan@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [meta-arago PATCH v2] img-pvr-sdk: IMG PowerVR
	SDK based demos
Thread-Index: AQHQe+pxXdl7Rmz/YkqlPxj7+tI7sZ1W5pMAgAl4AACAAF2soA==
Date: Mon, 27 Apr 2015 11:06:06 +0000
Message-ID: <24B88602B5904F49971CAF899152529B34C2FCBA@DBDE04.ent.ti.com>
References: <1429196326-11255-1-git-send-email-a0393906@ti.com>
	<4B26FB5A64EBA14C87266869E037F95814121E6D@DFLE09.ent.ti.com>
	<5535CFF5.70301@ti.com> <5536254A.7030309@ti.com>
	<553E16B0.8040009@ti.com>
In-Reply-To: <553E16B0.8040009@ti.com>
Accept-Language: en-IN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Subject: Re: [meta-arago PATCH v2] img-pvr-sdk: IMG PowerVR SDK based demos
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
X-List-Received-Date: Mon, 27 Apr 2015 11:06:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Jake,

I'm in the middle of some customer issue debug.
Could you please rework this patch to suit your needs? I will review the pa=
tch after you submit.

Regards
Karthik

-----Original Message-----
From: Stiffler, Jacob=20
Sent: Monday, April 27, 2015 4:30 PM
To: R, Karthik; R, Karthik; meta-arago@arago-project.org
Subject: Re: [meta-arago] [meta-arago PATCH v2] img-pvr-sdk: IMG PowerVR SD=
K based demos

Ping.

On 4/21/2015 6:24 AM, Jacob Stiffler wrote:
> This package is specified in
> meta-ti/recipes-graphics/libgles/libgles-omap3-no-x.inc
>
> Basically, the OGLES* example binaries are installed to=20
> ${bindir}/SGX/demos/Raw/
>
> On 4/21/2015 12:20 AM, Karthik Ramanan wrote:
>> Jake,
>>
>> Can you point me to the libgles-omap3-rawdemos package?
>> I couldn't find the bb file corresponding to this.
>>
>> Regards
>> Karthik
>>
>> On 20-Apr-15 6:01 PM, Stiffler, Jacob wrote:
>>> Karthik,
>>>
>>> Can this be modified so that the installation of the demos matches=20
>>> the installation of the libgles-omap3-rawdemos package for AM3 and
>>> AM4 so that Matrix scripts may be reused on the platforms?
>>>
>>> Thanks,
>>> Jake
>>>
>>> On 4/16/2015 10:58 AM, Karthik Ramanan wrote:
>>>> * This is a package with pre-built demos
>>>> * These demos will work on DRM
>>>> * Also contains utilities for SGX performance measurement
>>>>
>>>> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
>>>> ---
>>>> .../imgpvrsdk/img-pvr-sdk_3.3.2.bb                 |   29=20
>>>> ++++++++++++++++++++
>>>> 1 file changed, 29 insertions(+)
>>>> create mode 100644
>>>> meta-arago-extras/recipes-graphics/imgpvrsdk/img-pvr-sdk_3.3.2.bb
>>>>
>>>> diff --git
>>>> a/meta-arago-extras/recipes-graphics/imgpvrsdk/img-pvr-sdk_3.3.2.bb
>>>> b/meta-arago-extras/recipes-graphics/imgpvrsdk/img-pvr-sdk_3.3.2.bb
>>>> new file mode 100644
>>>> index 0000000..9387a74
>>>> --- /dev/null
>>>> +++=20
>>>> b/meta-arago-extras/recipes-graphics/imgpvrsdk/img-pvr-sdk_3.3.2.bb
>>>> @@ -0,0 +1,29 @@
>>>> +DESCRIPTION =3D "Imagination PowerVR SDK binaries for Jacinto6 SoC"
>>>> +LICENSE =3D "TI-TSPA"
>>>> +LIC_FILES_CHKSUM =3D
>>>> "file://Jacinto6-IMG-PowerVR-SDK-Manifest.pdf;md5=3D46bcbfc69f8837c339=
e15fd4a5044a8c"
>>>> +
>>>> +SRC_URI =3D "git://git.ti.com/graphics/img-pvr-sdk.git;protocol=3Dgit=
"
>>>> +SRCREV =3D "c2456ec3f03da022fb7489d6b381a4ac26a68203"
>>>> +
>>>> +PR =3D "r1"
>>>> +
>>>> +COMPATIBLE_MACHINE =3D "dra7xx"
>>>> +
>>>> +S =3D "${WORKDIR}/git"
>>>> +
>>>> +do_install () {
>>>> +    oe_runmake install DESTDIR=3D${D} }
>>>> +
>>>> +
>>>> +INHIBIT_PACKAGE_STRIP =3D "1"
>>>> +
>>>> +INSANE_SKIP_${PN} +=3D "dev-so"
>>>> +
>>>> +FILES_${PN} +=3D
>>>> "/opt/img-powervr-sdk/Examples/Advanced/OGLES2ChameleonMan \
>>>> + /opt/img-powervr-sdk/Examples/Advanced/OGLES2Coverflow \=20
>>>> + /opt/img-powervr-sdk/Examples/Advanced/OGLES2ExampleUI \=20
>>>> + /opt/img-powervr-sdk/Examples/Advanced/OGLES2Navigation \
>>>> +                /opt/img-powervr-sdk/PVRHub/* \
>>>> +                /opt/img-powervr-sdk/PVRScopeDeveloper/* \
>>>> +               "
>>
>


