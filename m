Return-Path: <ebutera@gmail.com>
Received: from mail-ob0-f180.google.com (mail-ob0-f180.google.com
	[209.85.214.180])
	by arago-project.org (Postfix) with ESMTPS id B82565298F
	for <meta-arago@arago-project.org>;
	Tue, 26 Nov 2013 12:56:57 +0000 (UTC)
Received: by mail-ob0-f180.google.com with SMTP id wo20so5607514obc.25
	for <meta-arago@arago-project.org>;
	Tue, 26 Nov 2013 04:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=+32d/tdhXyovtE+bHMZ2t3p7iCbBUmnFH+F6pGhmXEI=;
	b=ZLN4+7CdbQP1mUwrIefahpCziFgkEGyhGwwvku35F67FIqw0qiZmBC9V/hblMUENof
	MOiGXXVzZiL2t2Emv9+T4go8nRjvZirJ2WpLRs4Rh7Zwi/azVOwtOa+nmviwaB6Y8+cQ
	3rPBCI5VNDg0l1VtURI7ZG0r/4LJJ+A9Rfw2e+Pi1g+iB4rRqwRvY+Tn0v/oHJmBZR7w
	6CxoMfmWXASlSZjKUCJ6x6lv9iApVQhZsCSgAH/J4fNS6AGtg85Tkgn2lhXpWqwiLHqX
	Il21gwGytvD64qr0+EivbDw88gfkkBAC90cOV/12rOxhbp+rnTERF1SWjadpBxZi9W/k
	YxmA==
MIME-Version: 1.0
X-Received: by 10.182.250.200 with SMTP id ze8mr929316obc.72.1385470616176;
	Tue, 26 Nov 2013 04:56:56 -0800 (PST)
Sender: ebutera@gmail.com
Received: by 10.182.85.97 with HTTP; Tue, 26 Nov 2013 04:56:56 -0800 (PST)
In-Reply-To: <20131120152449.GC29952@edge>
References: <1383800614-31915-1-git-send-email-sam.nelson@ti.com>
	<7D46E86EC0A8354091174257B2FED1015983FDC3@DLEE11.ent.ti.com>
	<20131120152449.GC29952@edge>
Date: Tue, 26 Nov 2013 13:56:56 +0100
X-Google-Sender-Auth: EwJR3iqGVkETq1m5ZwvNSAIuACk
Message-ID: <CA+2YH7s5kRhh6t-pBgk_2XjiMOp1Jf2XxKQwLKQa2qW6VcY9sg@mail.gmail.com>
From: Enrico <ebutera@users.berlios.de>
To: Denys Dmytriyenko <denys@ti.com>
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH v2] cmem: Adding New recipe for cmem
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
X-List-Received-Date: Tue, 26 Nov 2013 12:56:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Nov 20, 2013 at 4:24 PM, Denys Dmytriyenko <denys@ti.com> wrote:
> On Wed, Nov 20, 2013 at 01:11:18PM +0000, Maupin, Chase wrote:
>> Sam,
>>
>> Were you going to post an updated set of these patches to meta-ti so you can
>> align with Mrinmayee? I think your approach of splitting out the packages in
>> linux-utils is a good one and will be cleaner going forward.  Since both of
>> your groups share these packages aligning between the two would be helpful.
>>
>> As a side note I assume you have other recipes that depend on the cmem
>> libraries that your cmem recipe provides.  Can you post one of those or
>> share it with Mrinmayee as an example of how you are able to point to the
>> right staging location for the libraries and headers for cmem in other
>> recipes.  I'm hoping we can start getting rid of ti-paths.inc but I'd like
>> to see how you were working around this.
>>
>> Denys,
>>
>> Since ti-linuxutils has other modules in it for edma, sdma, and irq but
>> those are only for legacy devices can we just replace the whole
>> ti-linuxutils with the cmem package which seems to be the main package
>> needed?  Or do you want to see additional recipes for the sdma, edma, and
>> irq moduled?
>
> I'd like to see other parts of linuxutils modularized, but that can be done on
> as needed basis for any of the new platforms when they require those. We can
> keep the old linuxutils around for a little longer, but it can only be used on
> the old 35x and 37x plaftorms only and there are many other components (like
> SGX) removing support for those old platforms already...

Please keep the linuxutils recipe until it can be replaced with the
modularized ones, it's useful for 35x and 37x dsp (gstreamer_ti).

Enrico

