Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 545DEC27C4F
	for <webhook@archiver.kernel.org>; Tue, 18 Jun 2024 12:13:43 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.84565.1718712820679201124
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 18 Jun 2024 05:13:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=ADwQH1cS;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: c-shilwant@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45ICDbLK003323;
	Tue, 18 Jun 2024 07:13:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718712817;
	bh=pZgiPQyoSk3GnaI+V3RYvosA506v8F8jicXQ84LSXc0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ADwQH1cS4GC+v2UI1pVDCWFqHMR/ooK0Qbvm//rZePq7FGdKtSuxnxt1hYhGVZI9a
	 pJrcJmpwYTGh1vYnmesAFIjDaqYTRnFnfi5kvAQQW+hILTm/dzgsxg6pqolxV8S+6l
	 nq7JY5vtiDQ69JnlNSA48YHBBJnnS2U7dHau2f+g=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45ICDb2B130964
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 18 Jun 2024 07:13:37 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 18
 Jun 2024 07:13:37 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 18 Jun 2024 07:13:37 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45ICDZG6089445;
	Tue, 18 Jun 2024 07:13:35 -0500
Message-ID: <78999f0d-e5e9-4a3a-9556-824b5f45186f@ti.com>
Date: Tue, 18 Jun 2024 17:43:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master/scarthgap][PATCH] recipes-qt: qt5: Add
 xkbcommon to qtbase PACKAGECONFIG
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>,
        Gyan
 Gupta <g-gupta@ti.com>
References: <20240603092255.2930095-1-c-shilwant@ti.com>
 <20240604160805.GN21287@denix.org>
 <8bcec881-5203-4b4f-b91f-cdd0ecadb269@ti.com>
 <20240606201456.GQ21287@denix.org>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20240606201456.GQ21287@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 45ICDbLK003323
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 18 Jun 2024 12:13:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15396

Hi Denys,

On 07/06/24 01:44, Denys Dmytriyenko wrote:
> On Wed, Jun 05, 2024 at 12:39:12PM +0530, Chirag Shilwant via lists.yoc=
toproject.org wrote:
>> Hi Denys & Ryan,
>>
>> On 04/06/24 21:38, Denys Dmytriyenko wrote:
>>> On Mon, Jun 03, 2024 at 02:=E2=80=8A52:=E2=80=8A55PM +0530, Chirag Sh=
ilwant via
>>> lists.=E2=80=8Ayoctoproject.=E2=80=8Aorg wrote: > From: Sai Sree Kart=
heek Adivi
>>> <s-adivi@=E2=80=8Ati.=E2=80=8Acom> > > - For QT apps to use physical =
keyboard,
>>> xkbcommon has to be added in > PACKAGECONFIG.=E2=80=8A
>>> ZjQcmQRYFpfptBannerStart
>>> This message was sent from outside of Texas Instruments.
>>> Do not click links or open attachments unless you recognize the
>>> source of this email and know the content is safe. If you wish to
>>> report this message to IT Security, please forward the message as
>>> an attachment to phishing@list.ti.com
>>> ZjQcmQRYFpfptBannerEnd
>>> On Mon, Jun 03, 2024 at 02:52:55PM +0530, Chirag Shilwant via lists.y=
octoproject.org wrote:
>>>> From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
>>>>> - For QT apps to use physical keyboard, xkbcommon has to be
>>> added in
>>>> PACKAGECONFIG. This was supported until 09.01 using xkbcommon-evdev =
which at
>>>> present is an invalid PACKAGECONFIG & hence was dropped from meta-ar=
ago [1].
>>>>> - Hence, add xkbcommon to PACKAGECONFIG which will enable the
>>> use of
>>>> physical keyboard in QT apps.
>>>>> [1]: https://git.ti.com/cgit/arago-project/meta-arago/commit/?h=3Ds=
carthgap&id=3Dde16946741249265a38acb7bb503b39a0c2b4175
>>>>> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
>>>> ---
>>>>   meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend | 2 ++
>>>>   1 file changed, 2 insertions(+)
>>>>> diff --git
>>> a/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
>>> b/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
>>>> index b1205b5a..6f94c574 100644
>>>> --- a/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
>>>> +++ b/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
>>>> @@ -4,6 +4,8 @@ GLES_EXTRA_DEPS =3D "libdrm wayland"
>>>>   >  PACKAGECONFIG[gles2] =3D "-opengl es2 -eglfs,,virtual/libgles2
>>> virtual/egl ${GLES_EXTRA_DEPS}"
>>>>   > +PACKAGECONFIG:append:k3 =3D " xkbcommon"
>>> This would make the package machine-specific - why is it only applica=
ble to k3?
>>
>> For non k3 based platforms, with the removal of Matrix GUI I don't see
>> any QT Demos under meta-arago-demos which might need the keyboard
>> functionality [Ryan correct me if we have any QT demo applicable for
>> non k3 based platform which needs keyboard].
>>
>> For k3 platforms, we have TI Apps Launcher (a QT based OOB demo) for w=
hich
>> xkbcommon is needed & hence I made this change machine specific.
> That is a wrong reason to make a large package that many other packages=
 depend
> on (and build on top of) to be machine-specific! That will force qtbase=
 to be
> rebuilt from scratch for each and every K3 platform, instead of re-usin=
g
> common Aarch64 binaries. Moreover, that invalidates sstate cache for al=
l other
> packages that depend on qtbase, essentially making them machine-specifi=
c as
> well... In other words - keyboard support does not sound even remotely =
as a
> machine-specific feature, so should rather be enabled or disabled globa=
lly on
> a per-distro basis. And thus, should be set in distro config file.


Sorry for the late reply.
Valid point, I will send out a v2 patch adding it for all instead of maki=
ng
it machine specific.


>
>
>> Btw, Denys do you have any background on why does meta-qt5 just in
>> case of Wayland doesn't
>> support this keyboard enablement by default though I see for x11
>> they add 'xkbcommon' in
>> PACKAGECONFIG by default [1]
>>
>> [1]: https://github.com/meta-qt5/meta-qt5/blob/scarthgap/recipes-qt/qt=
5/qtbase_git.bb#L70
> Wayland support in Qt5 is provided by its QtWayland module and it handl=
es
> xkbcommon. Are there some corner cases you are trying to enable with th=
is?


We are observing that without this patch, physical keyboards aren't
supported by QT Apps. Earlier meta-qt5 used to support that with
xkbcommon-evdev but currently it's an invalid PACKECONFIG. Hence, we
need xkbcommon which enables physical keyboards in QT Apps.


>

