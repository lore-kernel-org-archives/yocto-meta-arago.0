Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id BC4B15299B
	for <meta-arago@arago-project.org>;
	Tue, 15 Oct 2013 15:43:16 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9FFhFcd014644
	for <meta-arago@arago-project.org>; Tue, 15 Oct 2013 10:43:15 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9FFhFSD001940
	for <meta-arago@arago-project.org>; Tue, 15 Oct 2013 10:43:15 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Tue, 15 Oct 2013 10:43:15 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "Dmytriyenko, Denys" <denys@ti.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 3/5] qtbase: update bbappend to disable
	eglfs/gles for now
Thread-Index: AQHOyVZq4D3gdIOwAESwHYaQoPa6PZn151GQgAAAYWA=
Date: Tue, 15 Oct 2013 15:43:14 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101597B1D92@DLEE11.ent.ti.com>
References: <1381807317-3759-1-git-send-email-denis@denix.org>
	<1381807317-3759-3-git-send-email-denis@denix.org>
	<20131015032654.GB25798@edge>
	<7D46E86EC0A8354091174257B2FED101597B1D50@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED101597B1D50@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 3/5] qtbase: update bbappend to disable eglfs/gles for now
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
X-List-Received-Date: Tue, 15 Oct 2013 15:43:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable


>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Maupin, Chase
>Sent: Tuesday, October 15, 2013 10:42 AM
>To: Dmytriyenko, Denys; meta-arago@arago-project.org
>Subject: Re: [meta-arago] [PATCH 3/5] qtbase: update bbappend to
>disable eglfs/gles for now
>
>
>>-----Original Message-----
>>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>>bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
>>Sent: Monday, October 14, 2013 10:27 PM
>>To: meta-arago@arago-project.org
>>Subject: Re: [meta-arago] [PATCH 3/5] qtbase: update bbappend to
>>disable eglfs/gles for now
>>
>>On Mon, Oct 14, 2013 at 11:21:55PM -0400, Denys Dmytriyenko
>wrote:
>>> From: Denys Dmytriyenko <denys@ti.com>
>>>
>>> Until Graphics SDK gets updated to work with 3.12 kernel.
>>>
>>> Note: this effectively disables QtWebKit-based apps like
>matrix-
>>browser, as
>>> that depends on QtDeclarative and hence QtQuick, which requires
>>GLES.
>
>Hold on.  So QtWebKit won't work without GLES?  If so then we
>still have a problem with Qt5 support by default since not all
>devices have an SGX right?

Or was this dependency always there?

>
>>
>>BTW, I'll be adding conditional setting of this Qt5 PACKAGECONFIG
>>in the
>>global distro config based on "sgx" machine flag...
>>
>>
>>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>>> ---
>>>  meta-arago-distro/recipes-qt/qt5/qtbase_5.1.1.bbappend | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta-arago-distro/recipes-
>>qt/qt5/qtbase_5.1.1.bbappend b/meta-arago-distro/recipes-
>>qt/qt5/qtbase_5.1.1.bbappend
>>> index eaf1433..d35a948 100644
>>> --- a/meta-arago-distro/recipes-qt/qt5/qtbase_5.1.1.bbappend
>>> +++ b/meta-arago-distro/recipes-qt/qt5/qtbase_5.1.1.bbappend
>>> @@ -1,6 +1,6 @@
>>>  FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
>>>
>>> -PACKAGECONFIG_GL =3D "gles2 icu linuxfb"
>>> +PACKAGECONFIG_GL =3D "icu linuxfb"
>>>
>>>  SRC_URI +=3D " \
>>>  	file://0001-qeglfswindow.cpp.patch \
>>> --
>>> 1.8.3.2
>>>
>>_______________________________________________
>>meta-arago mailing list
>>meta-arago@arago-project.org
>>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

