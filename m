Return-Path: <paul.barker@konsulko.com>
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
	[209.85.167.193])
	by arago-project.org (Postfix) with ESMTPS id 065D452968
	for <meta-arago@arago-project.org>;
	Mon, 19 Oct 2020 19:15:19 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id u127so1151634oib.6
	for <meta-arago@arago-project.org>;
	Mon, 19 Oct 2020 12:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=yyAo8/YLuqGzWAlXCelvjifPZgl4QiZ/fDDCOlKldIc=;
	b=oorwOVtF6V2e0itHsy+yRIMUCTMrYCD0VvWP58KK5Sp4fiVF3FQHOUA4CEGhxE3eCF
	DbUNsDYhOpI4PXNALi+wpqbxW4TwTMX0n+RR91m1I9yPjYIAu/qj3j1KEHZjdL0rtXAz
	OizJpO5QmqBMOgsqQJONNWWtsR3li1SB2a4VY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yyAo8/YLuqGzWAlXCelvjifPZgl4QiZ/fDDCOlKldIc=;
	b=g/73sLE+4fC5MCrj0NrEmJtgtVvdszstuzoT4Q8KGm/4KvYAOYhbszS7BIAG0Eo/yv
	vZCXezy+KPDP+DKjKXjTPGAjx1UtHs6hYRKGwN90pQ4PWRgz0K3SbhrEXSzOIfOcAmvR
	r2bq1Adu9jMrwIUMkFUU/jGfCCcSdO+yolzNgjKpPgAfqDoHNled1idv4h7RLq0NQv05
	zhtvGRgi85t0aJ6+GiJR5Wt9TpT6Icq7m4CQzZYtGb1oYf5MS5Gvl0P5rKoSnkHzcsqB
	VXtrnWIcS1ngAwUT1vuBnVw2fwSgJJMiQuIp+VbRaFX+uKFd0XzPqghJFMMw5tf2DgqE
	bm1w==
X-Gm-Message-State: AOAM533zkFcTeHuSXQIgzWmkd8smkEmf40oxKlNk02nSZn87EhRI3doN
	djC23EwWweylKY1mlOOxvQLzV9vMBUuCsUrn9+wUzw==
X-Google-Smtp-Source: ABdhPJyBetEQaBbN1/xQLAMNZPp3zFjUlGXM/c+9Wu6SvRm2zJ99uU84p28ciK6U1/5kHLpt9vVgS01DVAHUALNZWLk=
X-Received: by 2002:aca:f202:: with SMTP id q2mr610489oih.6.1603134735612;
	Mon, 19 Oct 2020 12:12:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200621204349.363584-1-pbarker@konsulko.com>
	<20200629224351.GD6525@beryl>
	<20200630213041.GN7211@beryl> <20200814223055.GQ13081@beryl>
In-Reply-To: <20200814223055.GQ13081@beryl>
From: Paul Barker <pbarker@konsulko.com>
Date: Mon, 19 Oct 2020 20:12:05 +0100
Message-ID: <CAM9ZRVuOWAQssvFFPMUWm19nsN5NXXtgivbxecjjmXfGrUEp5w@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-arago@arago-project.org
Subject: Re: [master/dunfell][PATCH] linux: copy-defconfig: Move do_create_srcipk only if defined
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
X-List-Received-Date: Mon, 19 Oct 2020 19:15:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 14 Aug 2020 at 23:30, Denys Dmytriyenko <denys@ti.com> wrote:
>
> Ping.
>
> In case this was missed - the submitted patch was causing a breakage and was
> not merged. Thanks.

Hi Denys, I've not had a chance to get back to this one for a long
time due to illness and other priorities coming up. I've finally taken
a long look at it to find out why my builds were failing without this
patch back in June but seem to be fine without it now. I somehow ended
up with my CI system populating local.conf incorrectly so DISTRO was
set to poky but all the arago layers were included. The resulting
error messages were:

ERROR: /w/layers/meta-ti/recipes-kernel/linux/linux-ti-staging_5.4.bb:
Task do_create_srcipk from
/w/layers/meta-ti/recipes-kernel/linux/linux-ti-staging_5.4.bb seems
to be empty?!
ERROR: /w/layers/meta-ti/recipes-kernel/linux/linux-ti-staging-systest_5.4.bb:
Task do_create_srcipk from
/w/layers/meta-ti/recipes-kernel/linux/linux-ti-staging-systest_5.4.bb
seems to be empty?!
ERROR: /w/layers/meta-ti/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb:
Task do_create_srcipk from
/w/layers/meta-ti/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
seems to be empty?!

Should we support the case where the meta-arago-distro layer is
included but a different DISTRO is chosen? If so I can resubmit this,
the patch was broken as I mixed up the arguments to bb.build.addtask()
so it's easy to fix.

Thanks,


--
Paul Barker
Konsulko Group

