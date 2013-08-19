Return-Path: <chgans@googlemail.com>
Received: from mail-pb0-f43.google.com (mail-pb0-f43.google.com
	[209.85.160.43])
	by arago-project.org (Postfix) with ESMTPS id 89A055296F
	for <meta-arago@arago-project.org>;
	Mon, 19 Aug 2013 02:05:20 +0000 (UTC)
Received: by mail-pb0-f43.google.com with SMTP id md4so4365656pbc.2
	for <meta-arago@arago-project.org>;
	Sun, 18 Aug 2013 19:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=ZmlQYunsYRdl2joZBCGXEUCecnRLkinR7rasDs3ndoY=;
	b=C+fwWHGX4PIwqx3sIHf/YbtmHuYbVq/lpEEHzJjFBbTlXKUkxiC+m6PyzNMFWz6WbO
	iiHddiz5Ff+mWMW+79yzzwBc2QCJi0kMg0FsGgnQc+7qkWvzS60Kv2En7XvQgKdVOUQa
	plUmbdbdHc/szQoVW8gfNm8ILSVzjbofqS6g3x4LWvvcA+tTTEVDXMXlC+4r9jTrc0kH
	W4yjs0CY8iedQPavdLnoWG1JqGwqdOs9ml/JtSw6ec6xdfhG8MQN56Ef+uo9bKLA/QwP
	DXs4SLLT49K1ws3yfAsuX/oxRCyXfogve5KD8ghSEcgwZV2CyH6Djh1cGJnNbVBtinsn
	fuZQ==
X-Received: by 10.66.149.73 with SMTP id ty9mr10576359pab.36.1376877919053;
	Sun, 18 Aug 2013 19:05:19 -0700 (PDT)
Received: from [0.0.0.0] ([210.48.94.225])
	by mx.google.com with ESMTPSA id wr9sm11827477pbc.7.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 18 Aug 2013 19:05:18 -0700 (PDT)
Sender: Chris Gagneraud <chgans@googlemail.com>
Message-ID: <52117D55.8010502@gna.org>
Date: Mon, 19 Aug 2013 14:05:09 +1200
From: Christian Gagneraud <chgans@gna.org>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <520D8F5A.4000904@gna.org> <20130817150001.GD4931@edge>
In-Reply-To: <20130817150001.GD4931@edge>
Cc: meta-arago@arago-project.org
Subject: Re: u-boot-ti-staging failed to compile
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
X-List-Received-Date: Mon, 19 Aug 2013 02:05:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 18/08/13 03:00, Denys Dmytriyenko wrote:
> On Fri, Aug 16, 2013 at 02:32:58PM +1200, Christian Gagneraud wrote:
>> Hi there,
>>
>> I've started a brand new build today using arago-dylan-config.txt, I
>> got a build failure with u-boot-ti-staging, the whole log is on
>> pastebin [1].
>> In short, I got:
>> make[2]: *** No rule to make target `include/config_cmd_defaults',
>> needed by `spl/arch/arm/cpu/armv7/cache_v7.o'.  Stop.
>
> Hmm, I haven't seen that one before. I'm building dylan for am335x-evm and it
> includes u-boot-ti-staging that has no issues. What toolchain do you use?
>

Hi Denys,

I didn't change anything, so I am still using 
linaro/arm-linux-gnueabihf/4.7-2013.03/, do I need a newer version?

Regards,
Chris


