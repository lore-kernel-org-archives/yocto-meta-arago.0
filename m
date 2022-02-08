Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web09.9199.1644312516364435152
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 08 Feb 2022 01:28:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20210112.gappssmtp.com header.s=20210112 header.b=xxOHsRo2;
 spf=pass (domain: baylibre.com, ip: 209.85.221.52, mailfrom: clabbe@baylibre.com)
Received: by mail-wr1-f52.google.com with SMTP id i15so7138165wrb.3
        for <meta-arago@lists.yoctoproject.org>; Tue, 08 Feb 2022 01:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=a7xrdM1yAK4ys8qgnus/FUf0OUUhLSxpTCEDO4tsIyo=;
        b=xxOHsRo2XqsZ29QXS4CVsgTGhQlZDf4s108qL4SLPzl5OhBqKovcKf7tiir8pVag0x
         x+uFr1JOcMrdKis3vX6UHcaB4k3EzJJPgX+exOyvmyw0byt+PClYrlET/patWHR2nRsd
         /26SNkRjdTnzoJXeIqnF30WIlMfSCn5N5uFG11rE3IqceuDYoxlMKaCy27NN5/t6CXsU
         MOumeUOGccGCeaWYzKFwy4ug2suFq5r+znm4RwAILAmy9zw7OGVE/vHKWffqCJAdSLJZ
         ZOr72KQdyFyH7kOlg4rPGClrSQ068bnFsOleAD4B8Xy0bklYGJBMVo6FM4Nj8BytQeY7
         mVIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=a7xrdM1yAK4ys8qgnus/FUf0OUUhLSxpTCEDO4tsIyo=;
        b=Vg0U2cG1P/dODGSwOla/bSTNERE4SrIaE+ehc8lktElBA1IIdPOJW0gnpL2YLb2WOG
         xewe9GYEj1SjhYFn83Zi3wTrEM5HnAZRnW2Z04IlLaan4UDgzCFgevnGjyA+JkhjWK8o
         tc1DCfHc4r0e07wgnGyx/mY3zau98qGNtSgzYnY9rUolDFz3NkpxICmnds3hfnICWcoV
         /pbhM7YMLSyr2o8fLAD2W/KCAgoZ9TV/EcK6Mv5wIlcFX8laEO0Xv4JLdYxb7Fv0IU9d
         A+hCFjJfcSzCPimhgMRGWQ+fIt+88kFBeLJ8686Ie9C91V86urw1Oscw2Ca94IDEkfht
         WKKg==
X-Gm-Message-State: AOAM530MsjNZon86MqnC12jE+XH0r772sWpf/fhi71aLtoGP7DEazJT8
	FurK+MkrkmeORJ6WIPAIExoTuA==
X-Google-Smtp-Source: ABdhPJyaR/7MgXxy/uIClTl/xOTMlS6jBe7ekIJ2U8i6unekpJ7UDkFSpWwsbdoU1vIutVy/aFKD/A==
X-Received: by 2002:a5d:47a9:: with SMTP id 9mr2849522wrb.31.1644312514797;
        Tue, 08 Feb 2022 01:28:34 -0800 (PST)
Return-Path: <clabbe@baylibre.com>
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id z17sm1569755wml.38.2022.02.08.01.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 01:28:34 -0800 (PST)
Date: Tue, 8 Feb 2022 10:28:32 +0100
From: "Corentin Labbe" <clabbe@baylibre.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arago@lists.yoctoproject.org, khilman@baylibre.com
Subject: Re: [meta-arago] [EXTERNAL,dunfell PATCH v2] Use crypto_apps_script instead of crypto_apps_program
Message-ID: <YgI3wC7g7iiS6efH@Red>
References: <20220207084331.4147148-1-clabbe@baylibre.com>
 <20220207171924.GS26229@denix.org>
MIME-Version: 1.0
In-Reply-To: <20220207171924.GS26229@denix.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Le Mon, Feb 07, 2022 at 12:19:24PM -0500, Denys Dmytriyenko a écrit :
> It's recommended to indicate the recipe or general area of the change in the 
> beginning of the shortlog/subject, e.g. "matrix-gui-crypto-demos: ..."
> 
> https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> 
> 
> On Mon, Feb 07, 2022 at 08:43:31AM +0000, Corentin Labbe wrote:
> > From: Corentin Labbe <clabbe@baylibre.com>
> > 
> > crypto_apps_program depended on ti-crypto-examples which is disabled since 2 years now.
> > So let's fallback to original crypto_apps_script
> > 
> > Signed-off-by: Corentin LABBE <clabbe@baylibre.com>
> > ---
> 
> Also, the changes in PATCH v2 since v1 go in here.
> 
> 

Hello

I will fix thoses in v3.

Thanks
Regards
