Return-Path: <g-tammana@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 8006D520DE
	for <meta-arago@arago-project.org>;
	Fri, 23 Oct 2020 18:03:48 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09NI0h2H127997
	for <meta-arago@arago-project.org>; Fri, 23 Oct 2020 13:00:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603476043;
	bh=OE4ZlKb79J2l5ghyk1ylj/UcW4kQX1v0HpX5EPXmWyA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=Xv9B45z3knuXJfMwR2XCG+1DQ95jpzndNuiYwNeuLkTWRJkcPELRDoIexybD9lWu/
	Pdh/vCALMYJbkrEo3Ks3tRVMeZvksoT232/CyzCX/n923LGyvDSJs3ZyfPAb+404w/
	EYI30AhCBfi22VXrUV133YQRSQkMTZUeB50HyXxc=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09NI0hjp125999
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 23 Oct 2020 13:00:43 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Fri, 23 Oct 2020 13:00:43 -0500
Received: from DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11]) by
	DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11%17]) with mapi id
	15.01.1979.003; Fri, 23 Oct 2020 13:00:42 -0500
From: "Tammana, Gowtham" <g-tammana@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Murphy, Dan" <dmurphy@ti.com>
Thread-Topic: [meta-arago][dunfell/master][PATCH] cairo: enable gles2 support
Thread-Index: AQHWqGmYFo0C/71gW0m0E+gojyDuPqmls9MAgAAT14D//7HfcA==
Date: Fri, 23 Oct 2020 18:00:42 +0000
Message-ID: <fbb5727455434607bba8e06799095058@ti.com>
References: <20201022115052.7711-1-g-tammana@ti.com>
	<2ec10b3b-73fc-3bb2-8c26-fbb512665f24@ti.com>
	<20201023173127.GQ19741@beryl>
In-Reply-To: <20201023173127.GQ19741@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.39.41]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [dunfell/master][PATCH] cairo: enable gles2 support
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
X-List-Received-Date: Fri, 23 Oct 2020 18:03:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



>-----Original Message-----
>From: Dmytriyenko, Denys
>Sent: Friday, October 23, 2020 12:31 PM
>To: Murphy, Dan <dmurphy@ti.com>
>Cc: Tammana, Gowtham <g-tammana@ti.com>; meta-arago@arago-project.org
>Subject: Re: [meta-arago][dunfell/master][PATCH] cairo: enable gles2
>support
>
>On Fri, Oct 23, 2020 at 11:20:26AM -0500, Dan Murphy wrote:
>> Gowtham
>>
>> On 10/22/20 6:50 AM, Gowtham Tammana wrote:
>> >add gles2 support for devices which can support it.
>> >
>> >Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
>> >---
>> >  meta-arago-distro/recipes-graphics/cairo/cairo_%.bbappend | 3 +++
>> >  1 file changed, 3 insertions(+)
>> >  create mode 100644 meta-arago-distro/recipes-
>graphics/cairo/cairo_%.bbappend
>> >
>> >diff --git a/meta-arago-distro/recipes-graphics/cairo/cairo_%.bbappend
>b/meta-arago-distro/recipes-graphics/cairo/cairo_%.bbappend
>> >new file mode 100644
>> >index 00000000..3d67bb6a
>> >--- /dev/null
>> >+++ b/meta-arago-distro/recipes-graphics/cairo/cairo_%.bbappend
>> >@@ -0,0 +1,3 @@
>> >+PR_append =3D ".arago1"
>> >+
>> >+PACKAGECONFIG_append =3D " ${@bb.utils.contains('DISTRO_FEATURES',
>'opengl', 'egl glesv2', '', d)}"
>>
>> For completeness this patch breaks K2 builds as we discussed off line.
>
>Probably also need to check for "gpu" in MACHINE_FEATURES?

This might be a better choice here I think as this should be enabled for gp=
u enabled device. Will submit a v2.

Thanks,
Gowtham

