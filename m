Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 618215296F
	for <meta-arago@arago-project.org>;
	Tue,  1 Oct 2013 13:42:24 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r91DgNvJ028172
	for <meta-arago@arago-project.org>; Tue, 1 Oct 2013 08:42:23 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r91DgNEB030361
	for <meta-arago@arago-project.org>; Tue, 1 Oct 2013 08:42:23 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Tue, 1 Oct 2013 08:42:23 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 13/13] arago-qt5-image: add test minimal
	image for testing Qt5 migration
Thread-Index: AQHOvnZcn7vmP/DG0k2a9NfhB2N7apnfzNOdgABdEoD//7FKuQ==
Date: Tue, 1 Oct 2013 13:42:22 +0000
Message-ID: <A03F3585-657A-4257-B56D-6C036CF03B1E@ti.com>
References: <1380611472-23600-1-git-send-email-denis@denix.org>
	<1380611472-23600-14-git-send-email-denis@denix.org>
	<8778D9F4-AC13-4D36-908F-922789671691@ti.com>,
	<20131001132405.GD26572@edge>
In-Reply-To: <20131001132405.GD26572@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 13/13] arago-qt5-image: add test minimal image for testing Qt5 migration
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
X-List-Received-Date: Tue, 01 Oct 2013 13:42:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> On Oct 1, 2013, at 8:24 AM, "Dmytriyenko, Denys" <denys@ti.com> wrote:
>=20
>> On Tue, Oct 01, 2013 at 12:50:57PM +0000, Cooper Jr., Franklin wrote:
>> I'm not sure if Matrix is a useful application to include I'm this test=
=20
>> image. The backend for Matrix isn't included and no Matrix apps will be=
=20
>> installed so I'm assuming all this would do is open a white Window.
>=20
> It's a full WebKit-based browser, similar to one of the examples. You cal=
l it=20
> with an URL and it loads and renders that page. Tried it on http://google=
.com
I know I just didn't think it was a good Qt 5 test app more of a does QWebk=
it works.
>=20
>> Why not include something like the thermostat demo which is a much full=
=20
>> featured demo based on QWidgets and is probably our best means to discov=
er=20
>> any potential problems.
>=20
> Sure, why not :)
>=20
> --=20
> Denys
>=20
>=20
>>> On Oct 1, 2013, at 2:17 AM, "Denys Dmytriyenko" <denis@denix.org> wrote=
:
>>>=20
>>> From: Denys Dmytriyenko <denys@ti.com>
>>>=20
>>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>>> ---
>>> .../recipes-core/images/arago-qt5-image.bb             | 18 +++++++++++=
+++++++
>>> 1 file changed, 18 insertions(+)
>>> create mode 100644 meta-arago-distro/recipes-core/images/arago-qt5-imag=
e.bb
>>>=20
>>> diff --git a/meta-arago-distro/recipes-core/images/arago-qt5-image.bb b=
/meta-arago-distro/recipes-core/images/arago-qt5-image.bb
>>> new file mode 100644
>>> index 0000000..7d8ced9
>>> --- /dev/null
>>> +++ b/meta-arago-distro/recipes-core/images/arago-qt5-image.bb
>>> @@ -0,0 +1,18 @@
>>> +# Arago TI SDK base image
>>> +# gives you an image with Qt/E and other common packages shared by all=
 TI SDKs.
>>> +
>>> +require arago-image.inc
>>> +inherit remove-net-rules
>>> +
>>> +COMPATIBLE_MACHINE =3D "omap3|omapl138|ti33x|ti43x|omap4|omap-a15"
>>> +
>>> +IMAGE_INSTALL +=3D "\
>>> +    packagegroup-arago-base \
>>> +    packagegroup-arago-console \
>>> +    packagegroup-arago-base-tisdk \
>>> +    matrix-gui-browser \
>>> +    qtwebkit-examples-examples \
>>> +    qtbase-plugins \
>>> +    "
>>> +
>>> +export IMAGE_BASENAME =3D "arago-qt5-image"
>>> --=20
>>> 1.8.3.2
>>>=20
>>> _______________________________________________
>>> meta-arago mailing list
>>> meta-arago@arago-project.org
>>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

