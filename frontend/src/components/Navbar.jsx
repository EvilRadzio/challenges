const Navbar = () => {
    return (
        <div className="bg-white h-16 shadow">
            <div className="mx-auto max-w-7xl px-2 sm:px-6 lg:px-8 ">
                    <div className="flex flex-1 justify-between items-center">
                        <div>
                            <p className="font-bold text-3xl">Photo challenges</p>
                        </div>
                        <div className="flex items-center">
                            <button className="bg-blue-500 rounded px-3  py-1.5 my-4">Logout</button>
                        </div>
                    </div>
            </div>
        </div>

)
}

export default Navbar