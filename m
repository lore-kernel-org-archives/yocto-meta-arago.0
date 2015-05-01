Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id A13AE529A7
	for <meta-arago@arago-project.org>;
	Fri,  1 May 2015 16:40:53 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t41GeqpT031672
	for <meta-arago@arago-project.org>; Fri, 1 May 2015 11:40:52 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t41GeoNX002904
	for <meta-arago@arago-project.org>; Fri, 1 May 2015 11:40:50 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0224.002; Fri, 1 May 2015 11:40:50 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [nightly] Core TISDK 2015.04 build
	2015-04-30_22-00-51
Thread-Index: AQHQhCIvunlwKp6X9U+AMyqU5YB5h51nkxkA//+teTCAAF6SAP//s8GQ
Date: Fri, 1 May 2015 16:40:49 +0000
Message-ID: <2A8B581D-A02F-4947-98A1-B1DCE2A467E2@ti.com>
References: <1480745164.301.1430449311116.JavaMail.jenkins@puget>
	<20150501135817.GW29290@edge> <55438D20.6020203@ti.com>
	<20150501151906.GY29290@edge>
	<4B26FB5A64EBA14C87266869E037F958141293D2@DFLE09.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C881CD5@DFLE08.ent.ti.com>,
	<20150501161344.GA29290@edge>
In-Reply-To: <20150501161344.GA29290@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [nightly] Core TISDK 2015.04 build 2015-04-30_22-00-51
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
X-List-Received-Date: Fri, 01 May 2015 16:40:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Qt 5 makes it a bit more complicated. Since Qt 5 graphics acceleration uses=
 wayland which only supports using the drm interface for OpenGLES 2.0 which=
 we don't support.

Also I don't know if anyone understands if fbdev emulation and drm will pla=
y nice together for most use cases when used directly simultaneously.



> On May 1, 2015, at 11:13 AM, Dmytriyenko, Denys <denys@ti.com> wrote:
>=20
> So, I'm still a bit confused - due to SGX/GLES/Graphics lack of DRM suppo=
rt,=20
> we enable DRM in the kernel and also enable fbdev emulation on top of tha=
t. So=20
> any userspace apps that only support fbdev (3D GFX) can still function fi=
ne=20
> by utilizing /dev/fb0 instead of making direct DRM calls. But, the system=
=20
> still supports full DRM. What prevents other apps from using DRM directly=
?
> Or am I misunderstanding it?
>=20
> --=20
> Denys
>=20
>=20
>> On Fri, May 01, 2015 at 11:38:10AM -0400, Cooper Jr., Franklin wrote:
>> All platforms are using DRM.
>>=20
>> However, am335x and am437x are using what is called FBDEV emulation. Fbd=
ev=20
>> is an emulation layer that routes traditional fbdev calls to DRM. From a=
=20
>> userspace perspective it appears that 335x and am437x are using fbdev ev=
en=20
>> though technically they are using drm.
>>=20
>> The reason why we are using fbdev emulation and not straight drm is due =
to=20
>> the lack of support of drm in our graphics packages.
>>=20
>>> -----Original Message-----
>>> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>>> bounces@arago-project.org] On Behalf Of Stiffler, Jacob
>>> Sent: Friday, May 01, 2015 10:31 AM
>>> To: Dmytriyenko, Denys
>>> Cc: meta-arago@arago-project.org
>>> Subject: Re: [meta-arago] [nightly] Core TISDK 2015.04 build 2015-04-30=
_22-
>>> 00-51
>>>=20
>>> Does this mean drm is supported by all platforms, and "libdrm" can be a
>>> platform-agnostic dependency?
>>>=20
>>> -----Original Message-----
>>> From: Dmytriyenko, Denys
>>> Sent: Friday, May 01, 2015 11:19 AM
>>> To: Stiffler, Jacob
>>> Cc: meta-arago@arago-project.org
>>> Subject: Re: [meta-arago] [nightly] Core TISDK 2015.04 build 2015-04-30=
_22-
>>> 00-51
>>>=20
>>> I think there's some confusion... Does this link help?
>>>=20
>>> http://processors.wiki.ti.com/index.php/Linux_Core_LCD_Controller_User_
>>> Guide
>>>=20
>>> --
>>> Denys
>>>=20
>>>=20
>>>> On Fri, May 01, 2015 at 10:26:40AM -0400, Jacob Stiffler wrote:
>>>> I see the error:
>>>>=20
>>>> make[3]: *** No rule to make target
>>>> `../../gst-libs/gst/drm/libgstdrm-1.0.la', needed by
>>>> `libgstwaylandsink.la'.  Stop.
>>>> make[3]: *** Waiting for unfinished jobs....
>>>>=20
>>>> Looks like drm is needed for waylandsink. But I thought am3/am4 did
>>>> not have DRM?
>>>>=20
>>>>=20
>>>>=20
>>>>=20
>>>>> On 5/1/2015 9:58 AM, Denys Dmytriyenko wrote:
>>>>> Jake,
>>>>>=20
>>>>> gstreamer1.0-plugins-bad with your patch broke for am3/am4 platforms.
>>>>>=20
>>>>>=20
>>>>>=20
>>>>> _______________________________________________
>>>>> meta-arago mailing list
>>>>> meta-arago@arago-project.org
>>>>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>>>>=20
>>>>=20
>>>>> On 5/1/2015 9:58 AM, Denys Dmytriyenko wrote:
>>>>> Jake,
>>>>>=20
>>>>> gstreamer1.0-plugins-bad with your patch broke for am3/am4 platforms.
>>>>>=20
>>>>>=20
>>>>>=20
>>>>> _______________________________________________
>>>>> meta-arago mailing list
>>>>> meta-arago@arago-project.org
>>>>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>>> _______________________________________________
>>> meta-arago mailing list
>>> meta-arago@arago-project.org
>>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

