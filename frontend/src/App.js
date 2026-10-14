import {useEffect, useState} from "react";
import axios from "axios";

const App = () => {
    const [computers, setComputers] = useState([])

    useEffect(() => {
      axios.get('/api/computers').then(({data}) => {setComputers(data.data)})
    }, [])

    return (
        <div>
            {computers.map(
                computer => <div key={computer.id}>
                    {JSON.stringify(computer)}
                </div>
            )}
        </div>
    )
}

export {App};