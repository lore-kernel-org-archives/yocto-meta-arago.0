Return-Path: <paul.barker@konsulko.com>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by arago-project.org (Postfix) with ESMTPS id 8247752A72
	for <meta-arago@arago-project.org>;
	Tue, 17 Nov 2020 20:37:30 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id o3so10261864ota.8
	for <meta-arago@arago-project.org>;
	Tue, 17 Nov 2020 12:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XCv5tdMvxygMRWBDAFPI+IAOQePQGSkT4vhhueV2Oks=;
	b=qWmk8JhtUwCcjSWQ1T9u42C2KzQuHVE1IIQ7PNugzUWjk54DyByp0GOBIBiago5+el
	7eSGbrX7iF35LgFzak/FOYMAoCbOQGDdgNAb71RsOkuxoH1tdFi2yQCgZ8IohYvVojNs
	wofTTUdwOPHSyLRFxR4FAGmMTB+00cKRQaQzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XCv5tdMvxygMRWBDAFPI+IAOQePQGSkT4vhhueV2Oks=;
	b=S6ihtVT0vap4z8HuYq/tFKT4lk5sEySXY9WOSpg9ifWtV3HrD8FJNpTjo3vXGUvCK0
	jYxW4b8s6QnGASAs8pFopptkVacZApfPW5i4zfVA6YVclYiihIt3QxIdxyBE2gDNP68A
	yuT7Q2pJdOyGbJQHGPB8BLKnFhPaaUoAqvvNtEWQPZzaxMLfp5HzSDfqbKk3M0ZVu4Sr
	H87QLYqAp+O1lcTmTWZR5LzK6TyV578VLhmHM+O4HauNBPWWKGvfAc8a+1vvnjL4ZfF1
	M0tG4LxSiBy6No0jSL1mxB+gyfXZS1lvkTHg1o2fgRD5yXVE5SvM4PF6QDPkHvUPXe/W
	1UWg==
X-Gm-Message-State: AOAM530re3r+lDu1J3GFWxc0DwKUSMBLz5BrIR/3ZBnteT0E1mz6E+1R
	AxKK12ZSnwRw9/aWK30Hg6CZ1MXNjQHQDB4NYfdgzQ==
X-Google-Smtp-Source: ABdhPJy3+PUIIHvt1jc0sp/j1PtFbCvefx+OFILiiy0xZs9o+G/LLZviWhLsdkAZD0Wa3kWli8P4HA4AFyXMm2X7R08=
X-Received: by 2002:a05:6830:22d2:: with SMTP id
	q18mr3929049otc.305.1605645448269; 
	Tue, 17 Nov 2020 12:37:28 -0800 (PST)
MIME-Version: 1.0
References: <CAM9ZRVua_tLGXPZ76A0Su2yzhKD=-=un_G33-UGJbsKAzh0t_w@mail.gmail.com>
	<94da8736-0000-a797-8f20-f766feb1f1df@ti.com>
In-Reply-To: <94da8736-0000-a797-8f20-f766feb1f1df@ti.com>
From: Paul Barker <pbarker@konsulko.com>
Date: Tue, 17 Nov 2020 20:37:18 +0000
Message-ID: <CAM9ZRVutG13oRD78iUsdJWZPmfqDJQ+4a6CXQ7ruG0B_s+PTDw@mail.gmail.com>
To: Dan Murphy <dmurphy@ti.com>
Cc: meta-arago@arago-project.org, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] How to tell when meta-ti/meta-arago or TI CoreSDK is released
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
X-List-Received-Date: Tue, 17 Nov 2020 20:37:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Nov 2020 at 19:42, Dan Murphy <dmurphy@ti.com> wrote:
> Paul
>
> On 11/17/20 1:17 PM, Paul Barker wrote:
>> Hey folks, apologies if this isn't the right place to ask but I can't
>> see where else I should be asking this question.
>>
>> The Sancloud BSP layer (meta-sancloud) depends on both meta-arago and
>> meta-ti. For our Arago builds I typically pin release versions of
>> these dependency layers, especially for meta-arago and meta-ti I want
>> to ensure that we're using known good versions. The tag we're
>> currently pinned to is 07.00.00.005 which I believe corresponds to a
>> TI CoreSDK release. I see there are some new tags in these layers and
>> in the ti-linux-kernel repository
>>
>> I also see that configs have been added to the oe-layersetup
>> repository which is usually my flag that something has been released.
>> However, in oe-layersetup both 07.01.00.004 and 07.01.00.005 have been
>> given config files while the meta-arago layer, meta-ti layer and
>> ti-linux-kernel recipes are up to 07.01.00.006. So my usual heuristics
>> are a bit confused.
>>
>> I've tried searching for "ti coresdk" in google but I can't find any
>> documentation for this. I've also tried looking at the Arago wiki but
>> this does not look to have been updated recently. The only list of
>> branches I can find is
>> http://arago-project.org/wiki/index.php/Setting_Up_Build_Environment
>> which is definitely obsolete.
>>
>> So all I can do is ask the question then - how do I find out when a
>> release of Arago (or TI CoreSDK) is ready to pick up and use?
> This is on my to do for next year to try to document expected release dates.
>>
>> To pre-empt the obvious question - we do test with the HEAD of the
>> dunfell branch of layers regularly but we're not happy to issue a
>> release of our own BSP without ensuring we're aligned on released
>> versions of the underlying layers where possible. We need to track the
>> releases in the ti-linux-kernel layer as we've seen in the past that
>> our kernel needs to match with the expectations of the meta-ti layer
>> if we want the PowerVR drivers to work.
>
> Sorry for all the confusion. I created those additional configs for our
> internal SDK consumers.
>
> The official release will be 07.01.00.006 and I will be pushing that
> config shortly.
>
> Yes I understand the issue with the PVR modules and kernel dependencies.
>
> Dan

Hi Dan,

Thanks for the quick reply there.

From my point-of-view what would be really helpful is release
announcement emails to the list when the release is "final" so that we
can easily tell that, for example in this case, 07.01.00.006 is the
release proper.

Thanks,

-- 
Paul Barker
Konsulko Group

