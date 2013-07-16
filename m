Return-Path: <chgans@googlemail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by arago-project.org (Postfix) with ESMTPS id 5166552A07
	for <meta-arago@arago-project.org>;
	Tue, 16 Jul 2013 21:28:22 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id kp12so1205814pab.35
	for <meta-arago@arago-project.org>;
	Tue, 16 Jul 2013 14:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=lp7x/zre6D/X1eqQ6ibmfHercX1fRt3QWrbHzOOo/Z0=;
	b=DmGI+MhSw17OUssO/fzaQvzx4owGTf6aqOenUrw33D12MxUaLA8W4SvVSny5HFvV24
	LUKpB5jT0RpX5JdJ6BtwIh1KYr7j57fFM/NKHzMMMkHwbsq0frTnhyYTevTV4vfW72kP
	uVfzJZHZEMe2cbE7oiZ4qDDNhQBK1ZCzWgSrFC9Di7vKChFuLIxesDAOv9HdX0YThFic
	9nETTHxzOQQ4qjENkFPzJXar6jSUUHjKSaxwoecyCTxglNzHFVm1m0Sd89LhWJDfDZDp
	lKhV3Zf4K5Gxq9D2l8Nq2YbwWIx2pZjQHau/IqlJGVX6w4haEiWscmvf4RAPDRisU/2C
	IXHA==
X-Received: by 10.66.166.232 with SMTP id zj8mr4540438pab.139.1374010101221;
	Tue, 16 Jul 2013 14:28:21 -0700 (PDT)
Received: from [0.0.0.0] ([210.48.94.225])
	by mx.google.com with ESMTPSA id 4sm3761080pbw.32.2013.07.16.14.28.18
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 16 Jul 2013 14:28:20 -0700 (PDT)
Sender: Chris Gagneraud <chgans@googlemail.com>
Message-ID: <51E5BAF0.10206@gna.org>
Date: Wed, 17 Jul 2013 09:28:16 +1200
From: Christian Gagneraud <chgans@gna.org>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: "Maupin, Chase" <chase.maupin@ti.com>
References: <51E386CF.9030704@gna.org>
	<7D46E86EC0A8354091174257B2FED101596576BD@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED101596576BD@DLEE11.ent.ti.com>
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [arago/yocto-1.3] crda and python-m2crypto
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
X-List-Received-Date: Tue, 16 Jul 2013 21:28:22 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 17/07/13 00:58, Maupin, Chase wrote:
>> -----Original Message-----
>> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>> bounces@arago-project.org] On Behalf Of Christian Gagneraud
>> Sent: Monday, July 15, 2013 12:21 AM
>> To: meta-arago@arago-project.org
>> Subject: [meta-arago] [arago/yocto-1.3] crda and python-m2crypto
>>
>> Hi,
>>
>> While building an image with arago-stable/yocto-1.3, I encountered
>> an error:
>> DEBUG: Executing shell function do_compile
>> NOTE: make -j 8 MAKEFLAGS= all_noverify
>>    GEN  keys-gcrypt.c
>>    CC   crda.o
>>    CC   intersect.o
>>    Trusted pubkeys: pubkeys/linville.key.pub.pem
>>    CC   print-regdom.o
>>    CC   regdbdump.o
>> ERROR: Failed to import the "M2Crypto" module: No module named
>> M2Crypto
>> Please install the "M2Crypto" Python module.
>> On Debian GNU/Linux the package is called "python-m2crypto".
>> make: *** [keys-gcrypt.c] Error 1
>> make: *** Waiting for unfinished jobs....
>> ERROR: oe_runmake failed
>> ERROR: Function failed: do_compile (see
>> /home/christiaga/projects/yocto/arago/build/arago-tmp-external-
>> linaro-toolchain/work\
>> /armv7ahf-vfp-neon-oe-linux-gnueabi/crda-1.1.1-
>> r0/temp/log.do_compile.15753
>> for further information)
>>
>> Basically crda doesn't build because it needs python-m2crypto,
>> i've
>> installed it via apt-get and everything was fine then.
>> This is not documented in [1], [2] nor in [3].
>>
>> After digging a bit I found that the CRDA recipe comes from
>> arago-distro-extras, but it can be found in
>> meta-openembedded/meta-networking (on master, not on danny branch)
>> as
>> well. Looking at [4], it seems this version would have this
>> dependency
>> built by bitbake (python-m2crypto-native), again python-m2crypto-
>> native
>> is available only on master, not on danny.
>
> In the meta-arago danny branch there is a python-m2crypto recipe
> that extends native. So can you add the DEPENDS on
> python-m2crypto-native to the crda recipe with danny and have this
> work? Is that the solution you  are mentioning?

You are right, and actually crda (from meta-arago) already depends on 
python-m2crypto-native.
Anyway, it doesn't seem to be enough as my build failed, and I had to 
install my distro version of python-m2crypto to fix this (unless it got 
fixed as a side effect of re-running bitbake).

I might clean and rebuild everything, I thought I could update the 
layers without rebuilding everything from scratch, in theory it should 
work, but in practice I'm not sure it does, as I had a couple of issues 
(after my last update) that doesn't make sense to others (BlueZ version 
issue, Qt  and now crda).

Thanks,
Chris

>>
>> Do you want me to open a bug report somewhere?
>>
>> Regards,
>> Chris
>>
>> [1]
>> http://www.yoctoproject.org/docs/1.1/yocto-project-qs/yocto-
>> project-qs.html
>> [2]
>> http://arago-
>> project.org/wiki/index.php/Setting_Up_Build_Environment#Host_tools
>> [3] http://www.openembedded.org/wiki/Getting_started
>> [4]
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


