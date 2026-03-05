Return-Path: <jcormier@criticallink.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 185E3F33A91
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 15:28:25 +0000 (UTC)
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46830.1772724494871550225
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 07:28:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticallink.com header.s=google header.b=Xn+iEr1m;
 spf=pass (domain: criticallink.com, ip: 74.125.224.43, mailfrom: jcormier@criticallink.com)
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-64ca4dfdd88so7945699d50.0
        for <meta-arago@lists.yoctoproject.org>; Thu, 05 Mar 2026 07:28:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772724494; cv=none;
        d=google.com; s=arc-20240605;
        b=j1SWrrrN6hD7C7fztZaM2+Qdg1Geqz37BKr+28r/sA+NlC9WvpJWrkFBCEk097T1Ac
         AWT49CSfmv7zCEeI1ErvcC965BnFUfH+Ga1m+eZvcpuBhx+l1QF5rZsQktJaBEQGfSHD
         +saadmrwuESYK/kq0oJZ0IX1Zn5s3OK0Trkuh7EC+VXS0jtbOd2ERkK8VjAk8Ers0LRW
         zI+Fz1OKKhGEgYHuR/WbkEJJJWW7jfVwGdicoO2dZHCPrj1hnwrM4gDUmZ0MoPs7kdx8
         FSvA0clligKqQPq1Ly6mi9rvnxX98LieDYAg2IioOHeh4By4l8nlhBFV1pLmxQEwedpA
         hZaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Eko6AU7A/FjLvUh8t7vGw2VcfxLMZ5ePrJw/5Zqe9f8=;
        fh=WPRpuP2/bNBzZlGc170AjvAgYXBDxHsPReRdp0x4lkw=;
        b=W9DYme+GTtNWx1KyHRV2oLJHYFnpZnPYJwzXjrWcITGlFt9+XcUsii4bK9t6JR+Dtl
         qzHyhIR/obe5DIcYXz6ln3bl8f2YKmwP9GbQL0NMnwVnZ3w9ssdl/EemYE2ZRYD1LNVW
         BMSw3+8m6/AeRwjPfibgpAOvAf4syDTHiRIkzSgVMIa+FqOchkzaMsaRCTNncZp0Mw8J
         tAg6LRjnib+pjkY11UUKt3YFEksWr2gS9CueDNGqqACah+lSWeLy20vRnPuqKPZJ/BOL
         B5ieysIbJJnxlvH3eTSBFGvxm95fHOBkUyir07MFm8W8vVUsSpfF571cI4ARBIV9e9lS
         F/cA==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1772724494; x=1773329294; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eko6AU7A/FjLvUh8t7vGw2VcfxLMZ5ePrJw/5Zqe9f8=;
        b=Xn+iEr1mJLwyX6mW0881cLyQQF3vBJ2SsHX03KhY6HAP6nVr1hlUAmtQRi63CzGIb+
         f84QhOvKF7uHFWpUWZZlh68I7B/VaGbfjKrCAT+LrA+CDrEtMsR1w7LKB5m/ct9V7kXJ
         zEPv28FCFgdSKMWjcGkaqFmefG5EqXLNLePIihgyZyt3QUi5hF5Szeh1glT/HfOFZtha
         Ak5+ykH4zIDdahAqqXciO3T3P7mLXT14ggub0444BkgwTyZg6fiM0x+GG5u8wJEHfGLZ
         inz0OguhW7kiDqFLz6UzobRk2DO6m1PR6rw+38KmU169DJuAN+4Ee4gyFErEpAN1laeV
         uG4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772724494; x=1773329294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Eko6AU7A/FjLvUh8t7vGw2VcfxLMZ5ePrJw/5Zqe9f8=;
        b=rkOkRBjG6gfPC0o7yma6IM0p/wiDli84VSYA62Ijp/LoPAV42Vf0u9HkGBPeQ1bYTz
         3EntYzQ+fxnqCtbVtgL9OJAvzwxpCsxq5e1ihxqVsdsX5TrvxCkY14MRG4qbN8ORnI1C
         /NNHwffGixD4UXSWg1ITjlWEM9bw97G69Xml5o8fVyKauHdTVm2uCLtssiENrMzO22sB
         97EVILynSlNThWY9zKM0xVxUo0Z/gNR+Xf+OAM56YuVZPX3O4VXZC5DmqHPBdW3ScpMd
         1Y9kx3YHA9KP/xH9h9aNGVnpBs3nxlT3U7QORjvjJ/J+rDvbuoP3ONzZitniWcA4K+SE
         IFXw==
X-Forwarded-Encrypted: i=1; AJvYcCUtSA+NR0iMaaGPU1KkVQviJo5OSZ4tv5Bi+PPnHznvz9MvZ4T2upEXHGymj7IVYj3rQsBjcJ+CaQdW@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YzQ3omKGZbhD/CC0AVduOD68dE0fI77G52OwMipWWa1TsVKm316
	YBx6f5zrnD5Vgz6RikziTzXaWJV2AlfkRMmhz4seNf7N6cPkFG0jckBeAlmd+vfMlvZ9BteF6Tz
	dOnGAOP8ZamJC3FzGg/Hs9KMgf+a8DxPTpix09EV5
X-Gm-Gg: ATEYQzzEQc9vdrl3trt24vMyyJolvLwGIFNacHMbPioHuF8/u1ighabqbFP20Az5t7B
	cFP1nujE9j8LB5knxTQ99OgQgnSbdhIyD9VSdLDQafCqHexOBdfqTiRpuED9/J6VVbBh+7xvpMZ
	r+sPivQiUJfb0BXxXzlTxv4w5I6KUGGAn2n7urs6e5Jj0Db44XiW3TZPNxfkpITSJMtoKqfRvsL
	ib8AVShqIliRpZeIw9Fta0ydKUs1Lflhf4/NoylqWwDYMqGUic+KIOC+zLSSxFfxkmKIoD/TF7D
	x3ekuw==
X-Received: by 2002:a05:690e:4349:b0:649:4947:23e3 with SMTP id
 956f58d0204a3-64cf9b6cae7mr4437660d50.40.1772724493810; Thu, 05 Mar 2026
 07:28:13 -0800 (PST)
MIME-Version: 1.0
References: <20260303104930.889956-1-m-shah@ti.com> <d27ccb3c-4f70-486b-baf7-2dfc0943e240@ti.com>
 <565f34b6-b312-4dd1-a822-58cdc1bc7187@ti.com> <b919fb23-6b17-405c-8883-64610218e604@ti.com>
 <c6a06889-7318-4c2e-a626-01651273a798@ti.com> <f2e57ffa-0080-4f62-af5a-1cfcafbb944a@ti.com>
In-Reply-To: <f2e57ffa-0080-4f62-af5a-1cfcafbb944a@ti.com>
From: Jon Cormier <jcormier@criticallink.com>
Date: Thu, 5 Mar 2026 10:28:02 -0500
X-Gm-Features: AaiRm51yrbBfT8N61Pm-p0c8-mEJloD_tyd6lOh-DSoX7z_o4IElm3hiLgyGxXA
Message-ID: <CADL8D3ZBct5hv1g=KkvZHj0=X5-LOL9BSKfLhnb_1z8vPyJfnA@mail.gmail.com>
Subject: Re: [meta-arago] [PATCH] tisdk-uenv: Add instructions to load
 initramfs while booting linux
To: reatmon@ti.com
Cc: Moteen Shah <m-shah@ti.com>, Andrew Davis <afd@ti.com>, meta-arago@lists.yoctoproject.org, 
	a-limaye@ti.com, gehariprasath@ti.com, praneeth@ti.com, denys@konsulko.com, 
	vigneshr@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 05 Mar 2026 15:28:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17238

On Thu, Mar 5, 2026 at 10:06=E2=80=AFAM Ryan Eatmon via lists.yoctoproject.=
org
<reatmon=3Dti.com@lists.yoctoproject.org> wrote:
>
>
>
> On 3/5/2026 12:51 AM, Moteen Shah wrote:
> >
> > On 04/03/26 20:08, Ryan Eatmon wrote:
> >>
> >>
> >> On 3/4/2026 12:32 AM, Moteen Shah wrote:
> >>>
> >>> On 03/03/26 22:49, Andrew Davis wrote:
> >>>> On 3/3/26 4:49 AM, Moteen Shah via lists.yoctoproject.org wrote:
> >>>>> Add instructions to load initramfs image and update the boot comman=
d
> >>>>> to use the image to boot the linux kernel.
> >>>>>
> >>>>> Signed-off-by: Moteen Shah <m-shah@ti.com>
> >>>>> ---
> >>>>>   .../recipes-tisdk/tisdk-uenv/tisdk-uenv/uEnv.txt  | 15
> >>>>> +++++++++++++++
> >>>>>   1 file changed, 15 insertions(+)
> >>>>>
> >>>>> diff --git
> >>>>> a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/uEnv.txt
> >>>>> b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/uEnv.txt
> >>>>> index 0af0eef3..5ac61b34 100644
> >>>>> --- a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/uEnv.tx=
t
> >>>>> +++ b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/uEnv.tx=
t
> >>>>> @@ -7,3 +7,18 @@
> >>>>>   #       default on all newer U-Boot images.  This also means that
> >>>>> some
> >>>>>   #       variables such as bootdelay cannot be changed by this
> >>>>> file since
> >>>>>   #       it is not evaluated until the bootcmd is run.
> >>>>> +
> >>>>> +# Initramfs configuration
> >>>>> +# Name of the initramfs file in the boot partition
> >>>>> +name_initramfs=3Dti-core-initramfs.cpio.xz
> >>>>> +
> >>>>> +# Command to load initramfs from boot partition (mmc
> >>>>> device:partition)
> >>>>> +# Adjust the device number (0 or 1) based on your setup
> >>>>> +# mmcdev is set to 1 by default, partition 1 is the boot partition
> >>>>> +get_initramfs_mmc=3Dfatload mmc ${mmcdev}:1 ${rdaddr} ${name_initr=
amfs}
> >>>>> +
> >>>>
> >>>> This belongs in u-boot default env, it is basically the same as
> >>>> `get_fdt_mmc`
> >>>> and other helpers already there.
> >>>>
> >>>>> +# Load initramfs and set up variables
> >>>>> +load_initramfs=3Dif run get_initramfs_mmc; then setenv _initramfs
> >>>>> ${rdaddr}:${filesize}; setenv rd_spec ${_initramfs}; echo Initramfs
> >>>>> loaded at ${rdaddr}, size ${filesize}; else echo WARNING: Initramfs
> >>>>> not found, continuing without initramfs; setenv rd_spec -; fi
> >>>>> +
> >>>>
> >>>> This should be part of `mmcloados` in u-boot also.
> >>>
> >>>
> >>> mmcloados is only used by 'mmcboot' which is a differnt boot command
> >>> other than bootcmd_ti_mmc?
> >>> We can consider adding the load_initramfs to 'get_kern_mmc' and we
> >>> wont need to override the init_mmc with the change.
> >>>
> >>>>
> >>>>> +# Custom boot command that loads initramfs before kernel
> >>>>> +init_mmc=3Drun args_all args_mmc load_initramfs
> >>>>
> >>>> With the above added, you don't need to override `init_mmc` so
> >>>> this line goes away too.
> >>>>
> >>>> That leaves one line left, `name_initramfs`. How about just
> >>>> setting a sane default name in u-boot. We got away with something
> >>>> like this for K2 plats:
> >>>
> >>> We don't expect the name of the cpio to be variable, as the name of
> >>> the cpio stays the same for all K3 platforms which is
> >>> "ti-core-initramfs.cpio.xz", I can remove the variable altogether
> >>> maybe and directly use the image name to load. Thoughts?
> >>
> >> That is a very Yocto centric take.  But we also support armbian and
> >> other distros.  They may not want to name the file the same way we
> >> chose in meta-ti.  The question is, should we paint ourselves into a
> >> corner from the beginning or allow for some flexibility?
> >>
> >> Plus, even in Yocto, a user could choose to not use ti-core-initramfs
> >> and instead make their own with their own name. Making this more
> >> flexible feels more friendly in the long run.
> >>
> >
> > I see. So we want to move the structure to something which tries to loa=
d
> > any .cpio.xz present?
> > Other question, how do we tell other users to include the TPS6594
> > module(to put it in a better way include the packagegroup for intramfs)
> > while building their own initramfs(specifically for AM62a), is linux
> > release doc the right place to do so?
>
> I would say so.
Note from an  outside perspective, atleast having the cpio defined in a var=
iable
"name_initramfs=3Dti-core-initramfs.cpio.xz"
is sufficient to making it easier to override and load a custom file.
Instead of having to override the whole "get_initramfs_mmc" variable.
>
>
> > Regards,
> > Moteen
> >
> >> Just my two cents.
> >>
> >>
> >>> Regards,
> >>> Moteen
> >>>
> >>>>
> >>>> https://github.com/u-boot/u-boot/blob/master/board/ti/ks2_evm/k2e_ev=
m.env#L12
> >>>>
> >>>> although I'd recommend a more generic filename.
> >>>>
> >>>> Andrew
> >>>>
> >>>>> \ No newline at end of file
> >>>>
> >>
>
> --
> Ryan Eatmon                reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc.  -  LCPD  -  MGTS
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17234): https://lists.yoctoproject.org/g/meta-arago/m=
essage/17234
> Mute This Topic: https://lists.yoctoproject.org/mt/118111608/7902621
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub [jcormier@=
criticallink.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>


--=20
Jonathan Cormier
Senior Software Engineer

Office:  315.425.4045 x222

http://www.CriticalLink.com
6712 Brooklawn Parkway, Syracuse, NY 13211

