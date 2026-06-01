Return-Path: <jcormier@criticallink.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8CA5CD6E55
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 17:28:08 +0000 (UTC)
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4687.1780334883433230646
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 01 Jun 2026 10:28:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticallink.com header.s=google header.b=avLiS3OR;
 spf=pass (domain: criticallink.com, ip: 74.125.224.50, mailfrom: jcormier@criticallink.com)
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-66050c021f0so3154106d50.1
        for <meta-arago@lists.yoctoproject.org>; Mon, 01 Jun 2026 10:28:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780334882; cv=none;
        d=google.com; s=arc-20240605;
        b=lB2x59mh98qkhK8TNMRLJ0XNYSYgE3AA9l5DaPEyanHRtPSAKR5Bfke91nvN98KEHC
         87vwVP1caOnVase6jo0AoZPUVnauC+H+ZyCsxqGZISgYwRSt+aN5/mD4HZPt8U32OerQ
         6r6M0wPbTRyJ0o0zz02a044fA1kn5QVI6slZM9sXZuxpvy/6igMFx4khUio/euoDU2mN
         1Tmsvdqu93sHN0wmDhsl50GMSlx42b2UEp0hUl3kqqFRAXEBtoGXqiJr+VN3TJFJi6tj
         G2WWk7STrtMlXiyTgw4SamD7IEkf6uv6CUJvOvYWF3+DhPGK4pB/2pD/jxtjnO+M+gzA
         utbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DhIVDpxST8RVmIf4aZIZlj/3nIdcs/4WMnqLFKAyFkY=;
        fh=RWGS9LmwNYyL4O2IG4ub9slQVdvJPtb9TJ2KoT5KYtk=;
        b=b0BuXIO4ZbxCIPLi2xWHNeS5yAPbh1u1V1oKVPp83ZcNpUdrASCkzMdwQu1JKni5Rr
         +gvD6mVtqkeETbfCRpAnixBiSsTJyp/hXIwAMaiCGaERMLNcmoEAmnC6cREwb3j6Dq7r
         +AiVRb7a8JoyxAMfpIKcDz9RlaIl0qdYRgT+Y9xdS9QY5WrgjUp9vzsde1+tOg1rxrt8
         YmZ981ojz789oeU+tdVMNHATJS5+/JTK7QYKmtguBbbOMGw8EAeaGkzjKo1qqoy0HmKM
         QmUlwlKKTOa7qft0vyC/81giVosLXNloJoyITDIpbyBnLjd5RrbD39TIX+K4bVmiol6A
         MioA==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1780334882; x=1780939682; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DhIVDpxST8RVmIf4aZIZlj/3nIdcs/4WMnqLFKAyFkY=;
        b=avLiS3ORQTt6PuFW3zYnp3NBTloQNAP/6resZnecHeBLSHpD7RjRMbzzzPM8WiRa2Q
         ZavVdpIb2bnOjSBb6XvDIi2RVMUrNo6ve/5LyQ+MRLOFpTJDJlmDYSERJgN6mBqALkc6
         /ZgP8ZYsRUFQpqkOwPZYcRl95z+/i86W0q3BepkAFIXx1n7PhILjYyUKZYMJkDpNVcLs
         01mHR8C1KDQHWjSe774nHZ34ZJK44LelV3fsl7f69egZcgp9dCUqhdVeqV072VP0fGj+
         w6SrStRO9hsRGJMsTtkZOFonS9RNQ2W8BviDP7fGknXyel6vI1w8BwLqiFgU9cbvI1mb
         UxFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780334882; x=1780939682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DhIVDpxST8RVmIf4aZIZlj/3nIdcs/4WMnqLFKAyFkY=;
        b=SIkwI5y+9zwsRTpMVWFeSSKSofu9xNg8boWA4gKPaYdy9Ho7lFezKhLAnMrFOI/NYH
         BRj2uGgnCU/OhIvtl07D+i272Bxy4GgAnbIhy3K1JLvfspB6sloTNRY/LMNdUgQ8Ygtx
         +YSDmTjFfc2HHHpwiFVnNnJWU2y2G4JsHeLBvBcU1kTrpaZs6EeTAhmw9A4UloxxuAOK
         +JZO23opadxaRZQM5kL/XnMMH+RWK8R7dc+eLQzu8YDLrsbzH36wJ+/iV9b1p/X5Pac5
         9KGQxhMWzjKewCBAphN+xOpPv8gW0oEgbrlqKqhXRQIWl6WMbLMXCYs13LVyDuPerO3m
         doSw==
X-Gm-Message-State: AOJu0YwpXm4NlsUeWU9MNVNoNOcGf5LGD+wpGf2SWYK4VgdlD+mlb9RF
	JD84Ay1roNg0CUmShhFB2MbrKf3H9eGt1U8lJoAUaxarfFKDFEGhok1e9PrOP5+gPDsIdjlR21D
	X7fk58AIbU+VSBvQoslO54NzYzqikBhfI0X6JxWVM
X-Gm-Gg: Acq92OFCqgjKzmKPqQblVLhZDA+2vvJEbKYyKRbxr86co492Y9CIel9yUNbbWlqJHQZ
	Tb3avgQMKy86o7LEYFlwoV+bWi8EsyxvQ7ZinLEsSUevIPcWai6IY9z+cdPNx5dus8pXQ/LtWEJ
	iehy5UyBJWYuQlEPMdZs3eIz85UojURXO8ECSWLuHnwJH99oNCX/BsrNx/u99jQ8QcI+VkXv4FI
	AUGUVrXWnujjyyH9MSPtFCy5SFWnQ3A6UvjU51jhHqCKRQ+VCHwIQpp+zk8b/1Y5JEuxDCQSnlD
	v8Wh5DDeZXPDvDod
X-Received: by 2002:a05:690e:1593:10b0:656:b6bb:7c3b with SMTP id
 956f58d0204a3-6605ef99445mr8116684d50.37.1780334882250; Mon, 01 Jun 2026
 10:28:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260601171912.1146766-1-jcormier@criticallink.com> <20260601172040.2285970-1-prc@list.ti.com>
In-Reply-To: <20260601172040.2285970-1-prc@list.ti.com>
From: Jon Cormier <jcormier@criticallink.com>
Date: Mon, 1 Jun 2026 13:27:50 -0400
X-Gm-Features: AVHnY4KdBSXMesayxaO6RaQE7DQ1WZsnAm_hdYco2qzpkQE_h7EOq9uUraKBdZI
Message-ID: <CADL8D3YibcSpiGhAtMSJs4DTbEJ_Dt0uSXzpVTfwNatX5KdC_g@mail.gmail.com>
Subject: Re: [PATCH] .editorconfig: Preserve trailing whitespace in diff and
 patch files
To: PRC Automation <prc@list.ti.com>
Cc: meta-arago@lists.yoctoproject.org, rs@ti.com, reatmon@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 01 Jun 2026 17:28:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17549

Sorry will resend to the correct tags


On Mon, Jun 1, 2026 at 1:20=E2=80=AFPM PRC Automation <prc@list.ti.com> wro=
te:
>
> meta-arago / na / 20260601171912.1146766-1-jcormier
>
> PRC Results: FAIL
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>   check-yocto-patches: PASS
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> Patches
> ----------------------------------------
> WARN - [PATCH] .editorconfig: Preserve trailing whitespace in diff and pa=
tch files
>     WARN: Missing branches specifier [master/scarthgap/XXXXX]. (META-2)
>         patch:60
>             Subject: [PATCH] .editorconfig: Preserve trailing whitespace =
in diff and patch files
>
>     For details on the above errors/warnings visit: https://lists.yoctopr=
oject.org/g/meta-ti/wiki/40887
>
>
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>   apply-yocto-patch: FAIL
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> master
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Summary:
> - Patch Series: [PATCH] .editorconfig: Preserve trailing whitespace in di=
ff and patch files
> - Submitter: From: Jonathan Cormier <jcormier@criticallink.com>
> - Date: Date: Mon,  1 Jun 2026 13:19:12 -0400
> - Num Patches: 1
> - Mailing List (public inbox) Commit SHA: b0a1384f9e2be260dfaf112ccb645a7=
aa25d6f0e
>
> Applied to:
> - Repository: lcpd-prc-meta-arago
> - Base Branch: master
> - Commit Author: Thorsten Lannynd <t-lannynd@ti.com>
> - Commit Subject: meta-arago: chromium: clean up and simplify V4L2 patch =
series
> - Commit SHA: 30a611f56a4bd74d421e36ecddf705b956c01648
>
> Patches
> ----------------------------------------
> FAIL - [PATCH] .editorconfig: Preserve trailing whitespace in diff and pa=
tch files
>     error: .editorconfig: does not exist in index
>     Applying: .editorconfig: Preserve trailing whitespace in diff and pat=
ch files
>     Patch failed at 0001 .editorconfig: Preserve trailing whitespace in d=
iff and patch files
>
>
>


--=20
Jonathan Cormier
Senior Software Engineer

Office:  315.425.4045 x222

http://www.CriticalLink.com
6712 Brooklawn Parkway, Syracuse, NY 13211

