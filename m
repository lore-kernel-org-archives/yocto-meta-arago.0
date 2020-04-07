Return-Path: <pbarker@konsulko.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by arago-project.org (Postfix) with ESMTPS id DDD7C52A29
	for <meta-arago@arago-project.org>;
	Tue,  7 Apr 2020 14:05:58 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id y44so479227wrd.13
	for <meta-arago@arago-project.org>;
	Tue, 07 Apr 2020 07:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:subject:message-id:organization:mime-version
	:content-transfer-encoding;
	bh=AUKzG6W85ylE3cdVds1I058vhI1U4aArqilFYVfxk0s=;
	b=hA+8fJXmY2ga+ft2wx/fABf1UJC9XW6o8ULFilDj4jljBwttlGF7PxqnlPNcYAiQUY
	jSx1nllb67V40Aa43Bd/mqBsMvOBkcvoTCGGwXWz3793jlqLjJDW6ZfdjvD8DB3Ohx67
	lAYDP7qyLj5WMMVwfAHY1rK/CIy+iDHuNfHa8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:organization
	:mime-version:content-transfer-encoding;
	bh=AUKzG6W85ylE3cdVds1I058vhI1U4aArqilFYVfxk0s=;
	b=UqQSpmDZT3qjqJiEc0oiaFvV3Kmrcn+iftGRXPDlUP5rb3xV1re2WjqVW1+QUM071/
	bKgYc+hz8VCWYd4n/NRoJa9V59DItHQ5bmpqc9mVW1osQycF74YCEhZa1jlboyOec6u9
	Hnu2ciNfTQleMGxgNDdEaYrbKnBk45sZdJjS1b0Hs5w0ElRBfpOWeHC4CeiyfhXveMKM
	s8hGiIqUf95CZPJr0FZPr2KHpuF9szX9CzgYU0MZOeSe7sdpny7sJr4irQgBA3S6vfTL
	KaNwEdi5r8TKbMAkF7dmCggJ/qtImHFM/eC2fLerBWaG7dnMoqy0YU8yXebmY9u2//s6
	+vKw==
X-Gm-Message-State: AGi0PuZRqmaxhQqowMzpmuJ4HktBkp2NpWeLpWHq2Ysfc60tzTg0OgAh
	yPqPm9t+ry/Bp0u0Ua0eSXDrsdQ3JR9Z/w==
X-Google-Smtp-Source: APiQypJxv+qesO9J4pR5Z2fF72lSfK4MGzEri6V1Pqn+CInfyfprYxKEUA/L04gMJSbcMky37WCXSw==
X-Received: by 2002:adf:fa51:: with SMTP id y17mr3132086wrr.358.1586268224022; 
	Tue, 07 Apr 2020 07:03:44 -0700 (PDT)
Received: from ub1910 ([213.48.11.149]) by smtp.gmail.com with ESMTPSA id
	91sm25884769wrf.79.2020.04.07.07.03.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 07 Apr 2020 07:03:43 -0700 (PDT)
Date: Tue, 7 Apr 2020 15:03:40 +0100
From: Paul Barker <pbarker@konsulko.com>
To: meta-arago@arago-project.org, Hongmei Gou <a0271529@ti.com>, Denys
	Dmytriyenko <denys@ti.com>
Message-ID: <20200407150340.5a2dd76f@ub1910>
Organization: Konsulko Group
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: tensorflow-lite-demo SRC_URI is broken
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
X-List-Received-Date: Tue, 07 Apr 2020 14:05:59 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

The SRC_URI entry in the recipe for tensorflow-lite-demo is broken, see
meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-demo_git.bb.
It points at a file on the master branch in a repo on github using a
http URL with checksums. When something new was pushed to the
repository about a week ago the checksums became invalid.

I can guess why this was done (to avoid downloding the whole repository
via git) but it's a pretty terrible idea. The best solution may be to
mirror this file in the TI tensorflow-lite-examples repository
(https://git.ti.com/cgit/apps/tensorflow-lite-examples/) so there's no
need to download it from a separate source.

Thanks,

-- 
Paul Barker
Konsulko Group

